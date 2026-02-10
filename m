Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2526635971F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770731827; cv=none; b=UAK7KllqcD+SQM0vlXixzgV6AlYKfiZHzp7nPiTvATIJLvayM1R765HpsHTyjQu0m6TwyI6IgOeT94FHpC3lSo4cmhtum3Qk5qYfac+JX7dHx78nrZg++AWitkVViN9/c41mUretOFvNhC6hlBd2t72mxZVou9S7YSM6l/n5a9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770731827; c=relaxed/simple;
	bh=a9e+Q5siCUQ5I3SJEbQxJsb6hBQNhiRiGIUmMSZXi/M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aJZYMwautSBdTbTIRVmVW4eKligXM8y6BjAtICgoCeP4mcheYZBJ4fhQ/ijxhC/1d2kkIZY4vow3Mn486rviWFTx3WaWUIxtCfP2j54PO3l+i28kWvA42mPnkyGAd+HMQ5Mb0s3xxiOJmn9lDVNt1GR4dQdRB1jezcnNUkuShD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3OYh3Pk2; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3OYh3Pk2"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-48057c39931so50958875e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 05:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770731824; x=1771336624; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gf6cU9pv35ebpRCAES+qVGn52WnA5+sst08T+N7iQAg=;
        b=3OYh3Pk2xMu2Q0hUdKc1aC8nniQPmHB4DajG6H14Imp1aYF02bvTdjMWAB95UYZ7YF
         MAAUw95eX+ujtdwbnYDkjKxXTfizWwRQ8RsEoNR4jHLrfE1KIURjTagC34N3AL+aJ5QF
         4AP5XCDV2wQcFukNTFgwFSmtD8HkxZY5j5J3X3rKwKd6sPyQaJMl7lfa1g7HRPfbTXkV
         7rYv3urG9qpwL2TvN2KUNGduP8jc0SX34fi9U/vDhid9AmJBvw8WnhBIqqoc2bXm2kx+
         eAvKB6IllG2QMRxPExADX6jfVQv7K/61+lJprjAqF1jNP+18646lHbkTaGBbmcYx9oU0
         ibnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770731824; x=1771336624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gf6cU9pv35ebpRCAES+qVGn52WnA5+sst08T+N7iQAg=;
        b=iri7DMgKKcOpUuMrotgCwjHGiUj9goMM+qmbAPHYMx1YzMsQkgCOEimE8phI0G0M6m
         GVMVo2FrBlq0f8TwSA38SHwoRglBy9LbFX7AY188mlSPiNAfPovzOT80JNByOWyYT3Ur
         Wq+KtiMi3a8Dk4dMSavqMV2aDn73OiAyrpPykE5Ej28g++bwnBtC8A4HtvyKkiLYNObg
         IEDkqTy/wpzDzZRAlZpXnsTi6Xi+z2HWDbkXjsnCfUOInqTDT1UzfTOPizGUuxpoY4kV
         G0LTZuTcmJVc++eIFOIh5zx/7+f2AhAK/tFyv4YMPzOMBsatCKsKwClpTkg8rLLNHxq8
         0JzA==
X-Forwarded-Encrypted: i=1; AJvYcCUJjSlVghG2tRt8sM4FfxChxhW8VNJcKJSmLAtwn2g0MEhJgH63xSXc8G1rbEAKLEd5RrCSJvQwtbPuvauI7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxecVNhNFZeHc8n5r6L0nV9U7+oHbOI++5sJhYehFuPUiFzbxgb
	m0BEPfECDjwSulgjJhB++lfa4NFVn9TaQ794rdaNF8uUSt83OYTBETtmDQhstNfxcBDYqpbBaWv
	ZldiRLYIlZeBiow2VEg==
X-Received: from wmon23.prod.google.com ([2002:a05:600c:4657:b0:47e:df88:7cfe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8489:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-48320229bbfmr230670705e9.34.1770731824562;
 Tue, 10 Feb 2026 05:57:04 -0800 (PST)
Date: Tue, 10 Feb 2026 13:57:03 +0000
In-Reply-To: <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li> <0d336a3f-f317-4a70-942a-d87a3faa3a89@gmail.com>
Message-ID: <aYs5L1aG5S34teKT@google.com>
Subject: Re: [PATCH v3 0/4] rust: alloc: add Vec shrinking methods
From: Alice Ryhl <aliceryhl@google.com>
To: Shivam Kalra <shivamkalra98@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 10, 2026 at 07:08:09PM +0530, Shivam Kalra wrote:
> This is a follow-up to my v3 series:
> https://lore.kernel.org/rust-for-linux/20260207-binder-shrink-vec-v3-v3-0-8ff388563427@cock.li/
> 
> Hi all,
> 
> Thanks for the feedback on v3. Before I respin, I want to confirm
> the direction for v4 to avoid unnecessary iterations.
> 
> Proposed changes for v4:
> 
> 1. Drop the Shrinkable trait entirely. Make shrink_to() a normal
>    method on Vec<T, A> that calls A::realloc(). (Danilo)
> 
> 2. Add a temporary ShrinkQuirk trait to handle the vmalloc workaround
>    (page-boundary check + manual alloc+copy+free) until vrealloc
>    gains in-place shrinking support. (Danilo)

I don't think you want any new traits at all. What types would even
implement the trait? The special code can go in the realloc() method of
Vmalloc struct in rust/kernel/alloc/allocator.rs.

> 3. In the binder patch, use a less aggressive shrink strategy to
>    avoid shrink-then-regrow oscillation: (Alice)
>      if len < cap / 4 {
>          shrink_to(cap / 2);
>      }
> 
> 4. Fix commit prefix to rust_binder: instead of rust: binder:. (Alice)
> 
> Also noting that starting from v4, I will be sending patches from
> a new email address: shivamkalra98@gmail.com
> 
> Does this look right? Any other concerns before I send v4?
> 
> Thanks,
> Shivam
> 
> Note: I previously sent patches as shivamklr@cock.li. That account
> has run out of quota, so I'm continuing from shivamkalra98@gmail.com
> going forward. All future patches (v4+) will come from this address.
