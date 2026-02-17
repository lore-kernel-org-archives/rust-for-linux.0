Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2CC1684B0;
	Tue, 17 Feb 2026 20:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771360573; cv=none; b=DmbgRYJC4Tudl6wnm3KAfoP1dMPCD8g+d0Sw2lXjPVmjekIlsFqtMLdF70NJNOwFDB+0I+aV9d11QR0CD2URkl6pbW5dVYz7OBGZX1lspGhn/qa5PU+DQ/N7d4xpmKJe+KbWKks3+OA2tItxO+4XilUGWNFfPkcBvNuqTacDPTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771360573; c=relaxed/simple;
	bh=Hre9WgpSXBPPAauTT+j4xPzl+La6DQvAfmH8iONcoq0=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=h7WHHsAvnJEooM9r5ZwNkUMgagZpXrZ+j/s6g8gMzO6EH+/ByRtKGmRl/DGxylja2qICLN8TS+sbvYq0nWbesZXr8NiSXWuyQcyo+DS+T8rlWm24tsghuqaNxg/Hajwbww+1cPjccs0hyWV0FHKrcAMarrGJOKVOs8S2a+4vfbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rtD/S8cv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rtD/S8cv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD193C4CEF7;
	Tue, 17 Feb 2026 20:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771360573;
	bh=Hre9WgpSXBPPAauTT+j4xPzl+La6DQvAfmH8iONcoq0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=rtD/S8cvmYyGB9r+fNWB5vstF9bRcUNPYjgbX26nD2szUJ+BaOv+0DQ6wo0vwXq/F
	 g4SCh8+TMS7aCiwxR9Q+4WDechO2/HhSN4vS86rKIRAZ8eE89vRwiZWZ75JlJo46Wf
	 4nZWYOvSnPrCQM8pqxLJjFU62FEAYgWhPkPlSihqSwzrD0AKHzjR6J7iIKyPmYKXZm
	 5Odm3FG9JM3DLyaviylQ23YjEV9D234nnebZcDOyZwMl9YZScUjdyHl59HyBt9ZOHG
	 bOgCBYNhSVjLyGvggSVk2qKiO4/v0JbuhbNTiqK68jEsZX59TC4YR+/FT7BbpdzGlR
	 G/0xVPiUp9vNA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 21:36:08 +0100
Message-Id: <DGHIWYZTJONF.14FN5LON1T455@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/2] rust_binder: check ownership before using vma
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Carlos Llamas"
 <cmllamas@google.com>, "Jann Horn" <jannh@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-mm@kvack.org>,
 <stable@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
References: <20260217-binder-vma-check-v1-0-1a2b37f7b762@google.com>
 <20260217-binder-vma-check-v1-1-1a2b37f7b762@google.com>
 <DGHC1OLDIXC7.Q4IAOOSMHIY@kernel.org>
 <CAH5fLgj2+XUzsuAnvwL=dc=5yOZvXCapBWRbFGwJAX2v5Wk4dw@mail.gmail.com>
In-Reply-To: <CAH5fLgj2+XUzsuAnvwL=dc=5yOZvXCapBWRbFGwJAX2v5Wk4dw@mail.gmail.com>

On Tue Feb 17, 2026 at 9:12 PM CET, Alice Ryhl wrote:
> On Tue, Feb 17, 2026 at 4:13=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> On Tue Feb 17, 2026 at 3:22 PM CET, Alice Ryhl wrote:
>> > When installing missing pages (or zapping them), Rust Binder will look
>> > up the vma in the mm by address, and then call vm_insert_page (or
>> > zap_page_range_single). However, if the vma is closed and replaced wit=
h
>> > a different vma at the same address, this can lead to Rust Binder
>> > installing pages into the wrong vma.
>> >
>> > By installing the page into a writable vma, it becomes possible to wri=
te
>> > to your own binder pages, which are normally read-only. Although you'r=
e
>> > not supposed to be able to write to those pages, the intent behind the
>> > design of Rust Binder is that even if you get that ability, it should =
not
>> > lead to anything bad. Unfortunately, due to another bug, that is not t=
he
>> > case.
>> >
>> > To fix this, I will store a pointer in vm_private_data and check that
>> > the vma returned by vma_lookup() has the right vm_ops and
>> > vm_private_data before trying to use the vma. This should ensure that
>> > Rust Binder will refuse to interact with any other VMA. I will follow =
up
>> > this patch with more vma abstractions to avoid this unsafe access to
>> > vm_ops and vm_private_data, but for now I'd like to start with the
>> > simplest possible fix.
>>
>> I suggest to use imperative mood instead.
>
> How do you propose to reword "I will follow up this patch with"?

To fix this, store a pointer in vm_private_data and check [...]. Subsequent=
 work
will follow-up this patch with [...], but for now start with the simplest
possible fix.

>> > +        // This pointer is only used for comparison - it's not derefe=
renced.
>> > +        //
>> > +        // SAFETY: We own the vma, and we don't use any methods on Vm=
aNew that rely on
>> > +        // `vm_private_data`.
>> > +        unsafe { (*vma.as_ptr()).vm_private_data =3D self as *const S=
elf as *mut c_void };
>>
>> Maybe use from_ref(self).cast_mut().cast::<c_void>() instead?
>
> Honestly I think this one is easier to read as-is.

I remember this series: https://lore.kernel.org/all/20250615-ptr-as-ptr-v12=
-0-f43b024581e8@gmail.com/

It talks about enabling clippy::ref_as_ptr and I think we have it enabled, =
does
this not apply here?
