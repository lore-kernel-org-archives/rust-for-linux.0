Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B255837268B
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Apr 2026 21:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775685373; cv=none; b=IkPuPpCGyL66hQLjEEfQ/l9PhzdIpyhiYIe+Ag9GRg1+EJGDDt22W8DwPPuL9YHm/2fbSKYjm3Yb5THj8teUhMk+6P/bu16avUjCjUz3aNtOMxN54AICHm5JZpl47luf1yFj1lXi5HnX5yMY6QUojz4lqK76gaz1O34O6NY6/3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775685373; c=relaxed/simple;
	bh=8cxOfkqbYtilxsXmoRK/K1kQEGqS1uMc3RaSrHdx13U=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rduSdM2dUIckpdUYuyqo6eo10tmQDuzWCuo6vOxANqrKdbwhDom+GR4RzMRZmysE+dlO8Uq75TvEEDFukxOuq0cX/xw/S/aToPybVbuQKeLiM7gK27WhA3zg3q+3huJddgy4BwMqnNCLP/Sncesh1TxFTyyNBFQrFqVnjpVTNyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch; spf=pass smtp.mailfrom=protonmail.ch; dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b=Dw90gYUy; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="Dw90gYUy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
	s=protonmail3; t=1775685364; x=1775944564;
	bh=2qNHA2BYzYHt2AM76/vOenjLBmuQfRC5NcNdq8042iM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Dw90gYUyFozND9YwjOjo6ZV27M4rhU3fVH2iyirKnfMsU/rbU7d1tCZ6W2SLWzOaf
	 s/ODk879+aubF8fCLWrp9nvqIi4Zs64DfoEDhdplI2EHw0eLSQyt2AtNSLfYd+BIiw
	 d8XUcITtPY5S1jb1Gs0eXCC1OXXTc+gHQVs8FVS57IIinG+asa0jI1W/NNXUI/QLGp
	 qY9pl4wxOfeOz9BDrE7RbRw76D1rhlAejjRlnrwOY5tV0hvHhUcMs/cVJUY9eigkoK
	 LI6p1YVdUaWtMA9ChHYaxrAz1V6t/mxx1sz2G1SYGDCEkVMIMq99ojkvtq9Cy5I7v/
	 gVvpdry8NmYig==
Date: Wed, 08 Apr 2026 21:55:58 +0000
To: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
From: Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Cc: aliceryhl@google.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz, Christian Benton <t1bur0n.kernel.org@protonmail.ch>
Subject: [PATCH v2 0/1] rust: seq_file: add puts, putc, write, and hex_dump methods
Message-ID: <20260408215530.446994-1-t1bur0n.kernel.org@protonmail.ch>
Feedback-ID: 190658113:user:proton
X-Pm-Message-ID: 03267720ff72f835f9a5bcadd24d88e291b0793c
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This is v2 of the seq_file methods patch, addressing feedback from
Alice Ryhl and build issues reported by the kernel test robot.

On use-case:

Looking at the existing Rust Binder code in drivers/android/binder/,
there are several places where seq_print! is used purely to output
static strings, for example in freeze.rs and node.rs:

    seq_print!(m, "{}has frozen binder\n", prefix);
    seq_print!(m, "{}has dead binder\n", prefix);
    seq_print!(m, "{}has cleared dead binder\n", prefix);
    seq_print!(m, "{}has cleared death notification\n", prefix);

The static string portions of these calls are candidates for puts(),
which avoids the format string parsing overhead of seq_printf entirely.

write() and hex_dump() do not have obvious in-tree users today. The
motivation for including them is API completeness =E2=80=94 any Rust driver
needing these operations currently must call C bindings directly,
bypassing the safe abstraction. An out-of-tree user that motivated
the full set is the amdtelem driver, which exposes GPU telemetry
through a misc character device and uses hex_dump() for register
data output.

If the preference is to merge only puts() and putc() now and add
write() and hex_dump() when concrete in-tree users exist, I am happy
to split the patch accordingly.

Changes in v2:
  - Reformat use statement to satisfy rustfmt line length requirement
  - Rename as_c_int() to to_c_int() to satisfy clippy wrong_self_convention
  - Replace rowsize/groupsize as-casts with ffi::c_int::from() to satisfy
    clippy cast_lossless lint

Christian Benton (1):
  rust: seq_file: add puts, putc, write, and hex_dump methods

 rust/kernel/seq_file.rs | 87 ++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

--=20
2.53.0


