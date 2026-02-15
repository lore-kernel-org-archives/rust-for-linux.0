Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40932DC783
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Feb 2026 14:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771166403; cv=none; b=ra1IzN1KsnzhYEe9O87FldNtDcNsaR5bwKWO8DGO0L2P/fjjbpnfUqME0LODMLPnPPgpy0uNZNwOOE40tUkHT28pM1N0HWg9+Z5W8ZvkotinQP/byJ/M/Jh/yNbVbRrI0mfcsJyE44Pc9yJp2EPXv1DubCt3QR2LcBEOBTjAd3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771166403; c=relaxed/simple;
	bh=9QG9+AiGGMfO25rUF+7zs4VL5x7QCp41VBoQSlxl9Us=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=M9YjWiEccHf3wiC+qi3p4GazVjc9v4QIWN3V3D9Bod4kHeH+Zldnfgp4nArt7Jx/jiz2037HVW2VHsjfv0qNgvQ2MwrP9LPFPAPASNrL//BDz2d+mJqihWaM0e9A6tHc9HgNDqXQdwAJa9FxaJ7oeLZsYKgzQRhaiIs54bHr/9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l0ZioqgP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0ZioqgP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8C8C4CEF7;
	Sun, 15 Feb 2026 14:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771166402;
	bh=9QG9+AiGGMfO25rUF+7zs4VL5x7QCp41VBoQSlxl9Us=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=l0ZioqgP42CeTyDm9NXksjEpYWyCMiU+yasEog6OSAehGH06swTAlgCtou1tvGWIT
	 SdmC/ZWJp5GwhqeE7VpH+jpi8SUiklG1QjoB3FR8EcyEooHgybhps/y8a6rQkl+QGQ
	 9Art8AeqkBuxrnx19O2btCmd8+1rTWkyxuY+tlYukaSgNtCKPZlmtu3RCRxLEG6O89
	 GsZjD1WgbvlFtJb/VhhWQBQoQmg4O1A4FbUjy5m9nvfChGoYEMTY0dmR8ZlO09DE2S
	 n/dnGsnSv+dNMxuUZr9Q8opr7FFQHEzBwyhx3f033NnqjPfPFy71BfIbPLVwjM5Deq
	 +J1bJdZrbRldg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Feb 2026 15:39:57 +0100
Message-Id: <DGFM36CRX0U7.2RPN7REFTGFTW@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Alexandre Courbot" <acourbot@nvidia.com>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/4] rust: add pointer projection infrastructure and
 convert DMA
From: "Benno Lossin" <lossin@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260214053344.1994776-1-gary@garyguo.net>
 <DGEM8AITP519.149B3IVELY7HA@kernel.org>
 <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>
In-Reply-To: <CANiq72kt-it2y8iAR6uA-EuJ8pVygwvOV70MSd5+vYwq1Tp9Bg@mail.gmail.com>

On Sun Feb 15, 2026 at 1:47 AM CET, Miguel Ojeda wrote:
> On Sat, Feb 14, 2026 at 11:34=E2=80=AFAM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>>
>> Miguel: If you don't mind I would like to take this one through the driv=
er-core
>> tree as well, as it is not only the base for this fix, but also the base=
 for the
>> upcoming I/O infrastructure work.
>
> Is there some code that is currently "actually" buggy, i.e. not just a
> soundness bug, but actually triggering UB or similar?

I investigated this a bit in the beginning and I don't think this can be
triggered by us at the moment.

Here is a comprehensive explanation (maybe Gary can pick this up for the
commit message?):

The unsoundness comes from the fact that in the current version of the
`dma_read!` macro does not prevent the field access from "going through
a deref". Here is an example of an expression experiencing UB:

    dma_read!(dma[0].derefable.field)

Given `dma: &CoherentAllocation<Derefable>` and

    struct Derefable {
        inner: KBox<Struct>,
    }

    impl Deref for Derefable {
        type Target =3D Struct;

        fn deref(&self) -> &Struct {
            self.inner.deref()
        }
    }

    struct Struct {
        field: Field,
    }

The `dma_read!` creates a raw pointer to the dma allocation at the
provided offset. It then offsets that pointer according to the macro
input:  `&raw const (*raw_ptr).derefable.field`. This is the step that
produces UB:
- the Rust compiler finds no field named `field` on the `Derefable`
  type. It thus checks if it implements `Deref`, which it does, so it
  proceeds to try the target type.
- The target type is `Struct`, which does have a field named `field`, so
  it desugars the raw pointer offset to this:

    &raw const Deref::deref(&(*raw_ptr).derefable).field

This thus creates a *reference* into the dma-coherent memory, which
AFAIK is UB. It then uses that to call the `Deref::deref` function,
which reads from dma without volatile and then dereferences the read
value again.

Now there is a lint called `dangerous_implicit_autorefs` [1], which
exists to warn specifically on these implicit reference conversions. It
was introduced as error-by-default in Rust 1.89, so as long as we test
with latest stable, we should catch these.

An additional "layer of defense" is that `CoherentAllocation` requires
the generic to implement the `FromBytes` trait, which is incompatible
with "being a pointer" (this impl is missing from the example code
above).

I discussed a related question on the rust-lang zulip in which we also
talked about this unsoundness. The recommendation from the Rust
developers was to **not** rely on a lint for soundness [2]. There are
several ways to disable lints and it's not guaranteed that the lint will
catch everything.

[1]: https://doc.rust-lang.org/rustc/lints/listing/deny-by-default.html#dan=
gerous-implicit-autorefs
[2]: https://rust-lang.zulipchat.com/#narrow/channel/213817-t-lang/topic/da=
ngerous_implicit_autorefs.20and.20Box/near/572196666

Cheers,
Benno
