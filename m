Received: from a48-109.smtp-out.amazonses.com (a48-109.smtp-out.amazonses.com [54.240.48.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ACA14900B
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 23:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.240.48.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742081584; cv=none; b=r11/Uf67iQt1hwDkFNkRC34nFbKL0ufJb4OK2HgsBaZdR3rSQtubmWZjD/5VRqJShchoXOpyTRpAjJDYxyxjMAYk0exMEr0eG2v0091TnQVP1eqffNOXgscfY7FbLQhDTiKmnlyn2MRlsRBtEzZ+ca91u6z0KQiVcdhNmwf7P5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742081584; c=relaxed/simple;
	bh=1bl0FPWWMlYIsG5RMpf8E/BLv3qvOIg7kyXuUfLsSgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U9Nk2YX35XUaDx29nGh1gaf0Ahk2+y+jJlv7w4DSXMiF7O/3kq96V3EKmfMvtcJo4sEnTQMtr/Feb4+23R+UdUGdW/tJmJ8C9ZmMjZdti4Ye5kvlMQUGaLQ/Hpqv/6E1Uq81z/eh8/NcsL/2j6ByrwLMtjJ1mDhuRObkOmm8h4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=contact.antoniohickey.com; dkim=pass (2048-bit key) header.d=antoniohickey.com header.i=@antoniohickey.com header.b=MbicDbpG; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=jlmQEIzM; arc=none smtp.client-ip=54.240.48.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=contact.antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antoniohickey.com header.i=@antoniohickey.com header.b="MbicDbpG";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="jlmQEIzM"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=cgcwyxycg75iw36cao5ku2ksreqpjkvc; d=antoniohickey.com;
	t=1742081580;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1bl0FPWWMlYIsG5RMpf8E/BLv3qvOIg7kyXuUfLsSgo=;
	b=MbicDbpG4EP2maeT/HOJww45GSjc7vjp6mVgVkReU4U6dXT8Akkn/I2TJDjiqARI
	xVPyairNI+jPiwSfBe/ypfcY9/xyJX6cryLY8rj3l4qHud2zHPsZ8eAuT+0pK7XrJt5
	WLulclTWe1wPmoe8GpLTnhu4A/ysRkZVLjQOHqDXYer1jW9ZMAtvGvYtIWLfrdn1SYk
	H4RvXXAb8q+7qjoaUUR2B04F0LpZEbITPv2UYmB6IWjAv4d4fr6Yy6M3bsonfZ36r5w
	tIIeppXK5tCsGF15k+fov5iGtXoJuSqkyIdSsVqjanngX1DpOoIW45vWbpZjkKj+Ae7
	ZQl9flYkyw==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=6gbrjpgwjskckoa6a5zn6fwqkn67xbtw; d=amazonses.com; t=1742081580;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=1bl0FPWWMlYIsG5RMpf8E/BLv3qvOIg7kyXuUfLsSgo=;
	b=jlmQEIzM484zkrM9vSEepZvaOL0A41OFdGo+/Cqz0FllkbY0RL5RvTJp99oF8QIP
	G45yrRDcNg+VOl/MKgozI2ek+90Nee7Yv0sYT1YjD7y78KlDPTtWzKrmDqltoDNo0it
	iX5w2OJt6/yRN53WcUgODiEe7DM6QC6X/ahnv1c8=
From: contact@antoniohickey.com
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, contact@antoniohickey.com, dakr@kernel.org, 
	gary@garyguo.net, ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Subject: Re: [PATCH v3 0/3] rust: use &raw [mut] place instead of addr_of[_mut]!(place)
Date: Sat, 15 Mar 2025 23:33:00 +0000
Message-ID: <010001959c275e3a-a79b0b1b-97e3-4c1a-a298-f16f4573b96f-000000@email.amazonses.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CANiq72=X9DTfs-ZTPoAVju3=rKogVhjYXRcE405Hi8Z+v2nq_w@mail.gmail.com>
References: <CANiq72=X9DTfs-ZTPoAVju3=rKogVhjYXRcE405Hi8Z+v2nq_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.us-east-1.3SHHfi5Rh4c+NdtIv+pxNWeqDT0J3zAhYZLMebdhE9o=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.48.109

On Sat, Mar 15, 2025 at 10:31:10PM +0100, Miguel Ojeda wrote:
> For some reason, your cover letters appear in a different thread than
> the patches, and they do not get found by Lore in the thread of the
> messages themselves.
> 
> I assume it is because the Message-ID does not match, i.e.
> 
>     https://lore.kernel.org/rust-for-linux/20250314234148.599196-1-contact@antoniohickey.com/
> 
> vs.
> 
>     https://lore.kernel.org/rust-for-linux/0100019597091925-d4345a75-c75f-493c-87b3-3d0c4c722573-000000@email.amazonses.com/
> 
> Could you please try to fix it? It gets very confusing for anyway
> trying to follow in Lore etc.
> 
> You should be able to send all your emails from the same address with
> the same `git-send-email`/`b4` command etc.

Hey Miguel,

This has actually been bothering me as well. 

Here's the command I ran to send my most recent patch set:
```
git send-email --cover-letter --thread \
  v3-0000-cover-letter.patch \
  v3-0001-rust-enable-raw_ref_op-feature.patch \
  v3-0002-rust-replace-addr_of-_mut-with-raw-mut.patch \
  v3-0003-rust-clippy-disable-addr_of-and-addr_of_mut-macro.patch
```

After some research, it turns out AWS SES overwrites the message ID with it's own.

One idea I'm thinking of is sending the cover letter first as one command
and then sending the rest of my patch set manually fixing the `--in-reply-to`
so it matches the one it was overwrote with.

Learn something new with every patch I send haha.

Thanks,
Antonio
