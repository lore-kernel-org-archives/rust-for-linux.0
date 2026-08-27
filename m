Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4E22D4E9
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 14:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842772; cv=pass; b=kAC/Djx3OoryMPVlmL5TShyRJVQ7kbu+Qrsp8nOBX+/nYoZ6dLq76oKuPHi6ubwr0juzkBkrCA/dYEB9OQ60Cj66f3SS1e92JdRwJmkeFD1J1JQygHXXQZPe5zTtkZLW/Qpt99fiXS8+Q4Sww4ZoitvoNCg5vuU3Z47p6k4Q9eQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842772; c=relaxed/simple;
	bh=41WewWIErbX3yd9Z3vKfnXfsdNWRVLs4FM/DXBSS53c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h41YAcgn9YOcIPZTLnvJR79oGiYaAXlv9CgavCzSRTCJEkeA1t8oTwfU622wCNPsjNnjph8+rD1TR59ERvAaAW2CQKXW0xzkXWC/VlqCWvEKIwvh7WmeZYxWQjCiCC1En0JKckhzdZDqIGE4bsy3VDAbKDogso9taCfXkGON4FM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMdgmt1W; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMdgmt1W"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d03fcd26a6so2139295ad.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 07:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842770; cv=none;
        d=google.com; s=arc-20260327;
        b=kZufuGQ+7lSOwiZAXN7JMxQjWwX/4pJ/XId5xH19hPRtYS70asv7UzMo4b2DE7bbe5
         oQVolLrTtpIHpVELoEOV/SWNZ8Xva0flpVoZUijo2wdsFIKr9XbVWhMtY12evHjkuWoR
         MLINW/N0OvxwbC4oesXFZCJ4aHOpuLEUKK4WrYz+DNZuSrHRU6mUmQiSbBA8cnQfvo5+
         sydC6f68tvrfEK2PSphEmLoifdHmPBMkMDLSlmZL2MJYZ16eHWjF2Ui6bKgH1SLmNcU9
         i5vlxQoA1oIuxibDOZh9vw/KBk/NChM5hFhpQseVQYbCspwSfnB6b1qldbEZrwtTcEOm
         0Uyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3caV8jGIKYECCoF6AjoMVnw7A/xTQryGhAY1zu/DQLg=;
        fh=7V+AT8bUaeLcue0ZaLVGP6uj/aX2nqNVPWemScbz9GY=;
        b=lbzb7CYEwYzz01IBb6iJouzPnFLEt4DFkSqbEJc6M/OXtPZ1Wacty2NGfV9BGQ+2lr
         qFbEWYB/wk2HA5Ft6+T2kmyGfrSrwWZs+rm3Q/mhabjqwzdK+mFKPklfxOd/GRbNIRkx
         pyLmT1mTN1tEsPyFmxM3gFUgcxhMtfiRjYm8b9658oM14QvHiNMSoBCbCjZ9iwP1FWKn
         f8f/ADX+HVAKtTyykcst5y3ezCVYll+xZSje3ETMjZR64XlHIjwMJj25HNooTvIwPfrm
         tCCX82smqaUeqsRM8BLxBIfhX7URo5HDpiF1ceeQsowAoQQNzYf9SzZTCUx16om/bOpX
         TOfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842770; x=1788447570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3caV8jGIKYECCoF6AjoMVnw7A/xTQryGhAY1zu/DQLg=;
        b=QMdgmt1Wt/TKna15326h1CQJqqJV9kNggWJ+6lruH2vsyUr3pyLDAXl1c406Xb4TSp
         e0Xfvl1P2YgarMjFpi4zKv3MZYJHxJ2eZPxjpwHYjwrhbv7I035qamC3uI+a9coeOCqF
         voyjznUmKCH+ijuX8JbDR0EeKIC88y4aNojx/eUQ5VKhsGtddpASqNP6vsHrJ8z47LTs
         P7TNEw3YkA9YbveCPvwh1/8nD2NGrPqwuU/UEWmpOaqeqjE9Z6w6XKRVV3Sxn7xwcl1h
         9pSYjBDsPPuR2QnXPMxiO3jziFPicio449EOuxntLVg+U4O1Oj92UNVKgtSx50uSxOMS
         qchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842770; x=1788447570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3caV8jGIKYECCoF6AjoMVnw7A/xTQryGhAY1zu/DQLg=;
        b=CcVrL/DhbTzGC3C0a1npbC1YzweE9oObcBEY26NFnVPZkNbBKZcj3hab3hshSo+gFZ
         e4iVIbFfA/Kmfhz5qIae5/mwKG12be6QsDjcUqOWt4KXU452uTgXFU7JWnh1qdie1LkY
         kdGRdUGmCsTB4llWVaPrS+ybkMcTL0mp645uU//qKLHtjYNT8439zkHYDKGh+eL2J9f7
         sOP7GorhBctA6hqzIgWerHk9N53Lx/JzE6NDx17IfAe3uVTQ8Zsdy1RwxkPYkuLJbDOW
         j32vMeZokz+ASQEzumJXSnoUTeH6zn4ooTRRKeMt6Eo4KDOYwBBf9Kt2Bf/SDKfB+UpM
         hUvA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+WwfxuPbr/z45iMeZDv82p18KIAhuu2v/dknObZgVKueD5e9H90j2x76lcvMQQsefD1Wy11yozt8LG+rTtQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k47SKpXNfBUbxBrpzJaEuS6KbqBJ2k7Qb9AnHFjSUsKMVHYAN7
	n5cTloiSV2BQAG2Scof3/EZDbk5bPGbZDCQBm7jR+n7rFyGnZXj7sPbeDfuSpGrduTV2ZoatLNu
	hSWnH0e1Sgyf+kxHNtBmZW8CBVkMTtg0=
X-Gm-Gg: AR+sD10OyQ1+BGc+fxDBgRfY1oE6NGa/n29x2vcnEmh3loFwbdMaV0weQ7sM+RtSY9l
	hpjsrUYe90jXuHvefQypTTMHts6sPKB6svE8/72WUAIF9tCWEhG+iKA3zcV2t2wpenGEQhysdw7
	s7E87iJY4sTKKN77VsCQWqgPQ2Ti10265yliKIVWAG2i9OG2wNFOyNb0AsATadRBk/yWGmvuFbk
	p1t3v3TZW3/iZcQ/7SJJKdi7VZDd24JEBCnlvKaFyTfnmgKaUeYZeeFh1NDyAip5pd8b8IRRMQA
	9lTZpc/aiO0klDxlK0SW8mlSCQ+g0MeUBX2CGgiqwOpPB5HJ87vIWyoB/RLHT+TRlW8X2K/z30P
	+EWr766x3356ZsXURB/Kvq8hk6fYFB3jKcuX4k4FVFtkj0cOCaHz832W2S2cC
X-Received: by 2002:a17:903:3504:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d71e4f74abmr88346095ad.4.1787842769819; Thu, 27 Aug 2026
 07:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-3-mike@fireburn.co.uk>
In-Reply-To: <20260826163004.3365-3-mike@fireburn.co.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 27 Aug 2026 16:59:15 +0200
X-Gm-Features: AcwNN1W0d-V13zh5elWYWY1xq_Ye1PYxNifjQKCjt0be_UdVKV0D_eRNv-EoeZc
Message-ID: <CANiq72nTu0JMOQ2ovkCnrHVr3sFE648f0e1My9nesqmKz1Gpig@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: crypto: add synchronous RSA akcipher support
To: Mike Lothian <mike@fireburn.co.uk>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, Burak Emir <bqe@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
	David Gow <david@davidgow.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 6:30=E2=80=AFPM Mike Lothian <mike@fireburn.co.uk> =
wrote:
>
> +__rust_helper void rust_helper_aes_enckey_zero(struct aes_enckey *key)
> +{
> +       memzero_explicit(key, sizeof(*key));
> +}

Hmm... why does this one need to be a Rust helper? i.e. why doesn't it
call the other helper from Rust?

(Same for the other calls I notice here in the context of the patch to
`memzero_explicit`.)

i.e. helpers are meant to be as minimal as possible -- just forwarders
to the same functions unless there is a good reason not to.

And then you can have a safe function abstracting the call and use
that from the different places you may need in Rust (e.g. from
`Secret` and `Aes128`).

Thanks!

Cheers,
Miguel
