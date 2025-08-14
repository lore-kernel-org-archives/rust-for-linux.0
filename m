Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F1F2D9482
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755158246; cv=none; b=NfkBfJE31chTAis77P2hv02hTpTpm/9CWQd17ErGhJ8ycXVA6qhYuBvYR7tsrIQ22ah4SLnuTQJhD3LPhndHk/L8u0g8mZF3wHDaZYJqZgxvqIUAylVwS0OpmtvchkFh8DTu8cEj7EztoLpQlBUgo7gz2doxKVsa5Dt2WcPhHUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755158246; c=relaxed/simple;
	bh=W6MtOrDogN544oWxAZb3pFnY2Fo2+9FpOpoTzPtH90E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ab76ElsD5EW7M/7ok1mUTZP4tPDzt3k5zuIFkZrQnGT5zDYYcjxx1aGbiw1uxRsnVFThVfM+kG7BsQ/Gi1Jerl2uwCVsQAfQz8/4lTHGbpVXX+6lt8h6iz4JEC6NmA5eehrjOp13gafzIOh66VqBEF0CGw8o8IpoVQV5zfROXM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NVjK8kSu; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NVjK8kSu"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b9edf332faso218137f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Aug 2025 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755158243; x=1755763043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPHqnQ8xAazI/ywfiKc7DTnC7ionAOpO2TaL8wZxk98=;
        b=NVjK8kSu+B/fRF55yfnQoX6COqn6mjzaLoQWWKk27/+c2QRc8BV1Af+UsMjFhXjSkv
         rddfcTgiVIUThG2Dowboubu+jf7YSPhSwFxiNA00l7TokFM0URVgwgZDJj1XfqDWBpND
         5SeTzZPgG+eEyH/f04JrSuik2WbvekxRkUeUzrMelIrGElJf9pdyVyG3zV1m6gs85WAo
         cmT8dh5wGd0f34E/1reQhO6g8Pvd8uLv0M4xpt2nFEZhhOSW8CfyKS0PqhqzxnYyNfcS
         TCjZtPPwdlCysQNIO+CJl5ujyHj2eezveSaLwiRvmTWVfmeaU/CcyVH3OYhCKSbTF3NU
         D/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755158243; x=1755763043;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iPHqnQ8xAazI/ywfiKc7DTnC7ionAOpO2TaL8wZxk98=;
        b=dKUmxMdk8oC0TX5NrL1BEkgWo63O1IUsaU/b2JN/AoEvRf1OMAQd24ZNma21Sr1uwu
         pclLJgUB5HOCDSalB4zHr1eF+8m0qHwpSoVV6//vj6jh+BSv6mGvfDRfUEIeDHlMVNFt
         mOKJ3DOBywQ1ozUWj5YcqAs0yCbkg6LpLgjCcKE9+zKhncrPdz/meifIiUqSUNvZ5JSX
         D5CUi5zREQADm97zdoYktFbbSBaspZ6DhfzSDZhIRrGcdZPPDSBEhnTAKkgfCKtYlncm
         tVZ5aK6QwiAkqXfarkEkl9WvgzmQ3S8RTEf+JZKf2CJGIogzYVTtSnFt0nU7Y5czZund
         ErvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVN85wfF6ziyCVaWLfChBS9kROsL4cu776En0iuL49kbn9+ZsdZYCrDZK+KsYIwBfScciQ5p65Fm2eaH4mDWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Z/tHHF16pdlbLh8/1/W0ypqEXC05Qotz9WTJcRlo8bxUCcWM
	dUy29eeV+VgVOikW88/P5fiMzeXNCAZlnbQfgaTRLilransJ571osmPfxWdJCbqP3ZCSeXSQHZN
	WDYXuwjxENUQDcpNs8A==
X-Google-Smtp-Source: AGHT+IF8RLKUaVnA0eLlocCvsSggHMlTflVsZLjcx9Tqx3h5icjUoOZkCLvDvCHGu7338kKfEuuoa0VKz/yQfgc=
X-Received: from wmbea8.prod.google.com ([2002:a05:600c:6748:b0:459:ddb6:d66c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2410:b0:3b9:48f:1960 with SMTP id ffacd0b85a97d-3b9fc34d96amr1517515f8f.49.1755158243251;
 Thu, 14 Aug 2025 00:57:23 -0700 (PDT)
Date: Thu, 14 Aug 2025 07:57:22 +0000
In-Reply-To: <20250813133343.7877-1-benoit@dugarreau.fr>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250813-iov-iter-v4-2-c4f1932b05ef@google.com> <20250813133343.7877-1-benoit@dugarreau.fr>
Message-ID: <aJ2W4kgJGJPItC9F@google.com>
Subject: Re: [PATCH v4 2/4] rust: iov: add iov_iter abstractions for ITER_DEST
From: Alice Ryhl <aliceryhl@google.com>
To: "=?utf-8?Q?Beno=C3=AEt?= du Garreau" <benoit@dugarreau.fr>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 03:33:39PM +0200, Beno=C3=AEt du Garreau wrote:
> On Wed, 13 Aug 2025 08:27:18 +0000 Alice Ryhl <aliceryhl@google.com> wrot=
e:
>=20
> > +    /// Utility for implementing `read_iter` given the full contents o=
f the file.
> > +    ///
> > +    /// The full contents of the file being read from is represented b=
y `contents`. This call will
> > +    /// write the appropriate sub-slice of `contents` and update the f=
ile position in `ppos` so
> > +    /// that the file will appear to contain `contents` even if takes =
multiple reads to read the
> > +    /// entire file.
> > +    #[inline]
> > +    pub fn simple_read_from_buffer(&mut self, ppos: &mut i64, contents=
: &[u8]) -> Result<usize> {
> > +        if *ppos < 0 {
> > +            return Err(EINVAL);
> > +        }
> > +        let Ok(pos) =3D usize::try_from(*ppos) else {
> > +            return Ok(0);
> > +        };
> > +        if pos >=3D contents.len() {
> > +            return Ok(0);
> > +        }
> > +
> > +        // BOUNDS: We just checked that `pos < contents.len()` above.
> > +        let num_written =3D self.copy_to_iter(&contents[pos..]);
>=20
> This should use `contents.get(..pos)` instead of doing the bound check ma=
nually.

Using contents.get(pos..) does not have the same behavior as the bounds
check, because the bounds check exits early with Ok(0) if pos is equal
to contents.len(), whereas the proposed change would pass an empty array
to copy_to_iter.

Alice
