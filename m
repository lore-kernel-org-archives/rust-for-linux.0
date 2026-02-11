Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAE5278165;
	Wed, 11 Feb 2026 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770795110; cv=none; b=dT2/WteNA9thcOPXAJlvZOiddcjARPQhjdAA2Qx+QJdKL/GOZckB29vaDKsnafE7/KIZUQGVYXEsddO4+F+L66JliLGoC8L3uDVOHG8Q7FkrkEtvWXh1H46/cFA3/gW0LipgHFUDG4E0xZ515RkVXChrxFbxivogSl5xGOhSgag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770795110; c=relaxed/simple;
	bh=9EHT5RPp8vQoPFq66jLsuzFX8usAoEHMFqqYHfAXIy4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BCHNkmTvyCysj+UiT7qIGCJbVEv7I4XkXgd7z2tPy1Zcmi2+f+/ZA5S0M2nn++xF0BKmF6g0cBFlXrjjeGT0cnna+4ZCb94HRIDQrMCy8Dvp/H+0DO1ALls+Jwqwjmk33iIRow5lMuOIIvWxXIP3iS/8oLxCuoyDlmwORRFDBFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnVgslpE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnVgslpE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD4CDC4CEF7;
	Wed, 11 Feb 2026 07:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770795110;
	bh=9EHT5RPp8vQoPFq66jLsuzFX8usAoEHMFqqYHfAXIy4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FnVgslpEPhRjjL6RYtTQNqCbKEATWjN0B8ICj90sRkoMPaEMjdXjHqZQSplCR2nYZ
	 7j6U0AqNPfbsy/y5RX1Y0v9JGIQbfKe3ppRjAqnEGUeDNlp8LBCi+JmBLhTTvxZbh3
	 3crroFO0FA0B4DR9Sh91iY8ME4aaJX1CpAkDgDdICILPEtgpvbmAeK+qXTxiJy7s2P
	 3AhTAdCa/5g9wY/hdD7FrMSRdhDVTxyK27KVaNC1UjdLacfrZRrOxdPovVXumUIl+y
	 VZ7rx/o172F6CiYvhwXMfHJgco2SqF09Oc1gcI/klsb07SDCJyDbWbF3XXZr1XS1BA
	 d2ynYI+qAetcg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Christoph
 Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman
 Gushchin <roman.gushchin@linux.dev>, Harry Yoo <harry.yoo@oracle.com>,
 Daniel Gomez <da.gomez@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 03/12] rust: xarray: add `contains_index` method
In-Reply-To: <CAJ-ks9mF5x5mAUcfN6dWN-NWoaE=j-8h0y_F5AM2Pnfn8RcV6g@mail.gmail.com>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-3-f777c65b8ae2@kernel.org>
 <CAJ-ks9mF5x5mAUcfN6dWN-NWoaE=j-8h0y_F5AM2Pnfn8RcV6g@mail.gmail.com>
Date: Wed, 11 Feb 2026 08:31:39 +0100
Message-ID: <87ikc3viqs.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Tamir Duberstein <tamird@gmail.com> writes:

> On Mon, Feb 9, 2026 at 6:38=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> Add a convenience method `contains_index` to check whether an element
>> exists at a given index in the XArray. This method provides a more
>> ergonomic API compared to calling `get` and checking for `Some`.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
> As I said in v1 I'm -1 on this change. As gregkh would say: it's hard
> to review a new API without seeing its user.

I already gave you the user inline [1] and if you wish you can also see
it in a downstream tree [2]. Gary already explained why this is required
with the current implementation of the borrow checker [3].

Best regards,
Andreas Hindborg

[1] https://lore.kernel.org/r/87344gh2pk.fsf@t14s.mail-host-address-is-not-=
set
[2] https://github.com/metaspace/linux/blob/aa43a6ecb68a785a90e167609aa57c5=
a0860d123/drivers/block/rnull/disk_storage.rs#L218
[3] https://lore.kernel.org/r/DFK801ZCI1GD.34GWJ10JZBBBF@garyguo.net

