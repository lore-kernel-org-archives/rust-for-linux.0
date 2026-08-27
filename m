Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A643D668B
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 23:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787871653; cv=pass; b=u8mSv7iIMc5hbW2CZezoTBU+SPiQjrqKwkGq0yB0OPtyul72+3D7kK2pGG/NEgjEVE6ovLOewTpVTLbs8Fjg6YFUtDCBgn2IpUaRXb4eJWHrV1oQgNrGW1bBKSalMCSvsjeMOU6kiNV1iSYxsw0kDg4hUeSGOtVbvs4u6X9Jw4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787871653; c=relaxed/simple;
	bh=PtOQ1ctrt5ChIryejtRZPvf9ci4aQrCJNC6i+HqoyYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ikcAOvtS452fUi1Iyl9r0vT0K7Bp8w4nYULTCMcLut7lOYbwaSyXGIW1LPTGcGSb6hYE3FmAWVApRz9BBrQg2a9MCoVmD49/2JITqpkYY8YYdfZBRjKuoBkp0i5tznu3G6hS7epPcyp54WL859o1MfRzcnTNa7OdAUZVYdq+tOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p9+covru; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p9+covru"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d5862bc921so908815ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Aug 2026 16:00:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787871650; cv=none;
        d=google.com; s=arc-20260327;
        b=mJW/QUEbvddWELQ5mL5ENINinUMwic37vpeAO2P0xB3/j8Uee2UX+dbfWd4Lm22FWe
         P1RFKOOdY6A/rBhdUuEsGnkjazO9ZSqCnZDr7ux7we3coz0LTWwpoY/75iU9WxOdwUDu
         nZJXxmuGxJ4LLueUqtslTi0lt6EQPx9s4uLREHK2RUgbRvTtGQR1m9oh7aJNLkYsC2Ta
         s57e4H/1aSGx4LzChVW9bTe8DHhaf3WXBOtkqn1lCGCJ62iQoTU9rYVk5r0dNh2YTBtd
         YYoTPbkt6ZxOhj8gZEBYauwu/hZlYmWZjKW7fU8aFeacQsZADx4vQYqGXNrWcqyF2uoz
         9MXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PtOQ1ctrt5ChIryejtRZPvf9ci4aQrCJNC6i+HqoyYo=;
        fh=WGyABnBSm8MlYyQwDN2KzGbWukLO6kSpsXLDfdJnpYs=;
        b=JM4wfGN5cmZlEVfT7CCdYfvT7K6GqF2Teo3f5m8Cr9nLgUZHKEpdf9LPeagREQKECO
         epZZCWuWFJg3yh5bfFaWOKLCPBYJJlV43ssH/qojPzEIneYeliyuS+i8DzczPrpInJgB
         /S3T8I0U8F+tjSjX7cvVCO4sn0ToQ2ozbhV3c7z/f0EyzVK0BSZY9j2pnKiT60dK0+ER
         ChG3OMP8Wc1NwXWXRcaZAPldyb0RAcMqU60Wbh1VmMfN99x2WnSaSrl9kGyuvIzI6gzd
         x0v9TFZctOt5PbmVCzFR0IDfa2IAP0hE9V/7EzqgMNo81LRgOZQG5iD7kqFpiZb1ZYw2
         cV1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787871650; x=1788476450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PtOQ1ctrt5ChIryejtRZPvf9ci4aQrCJNC6i+HqoyYo=;
        b=p9+covru2Hp5BxxPX+gS4B4kj8l3iQMWtHIkbuwbH++g0b4ZFXpIwAUUa06uTwE4Qe
         Ie/QHJVFJmxZNI+YrdT6rxNByYEAqaFDnzMtvmtLvIumADy9Uja0h1eCjX6/8APpCb/F
         v+pb/A/Kh//celSSa/C8KiuFfGDDWvoCJYzbMIiabWsZHjuO49l0uydKOyuJ8JDeFqSE
         SISdkJV/TWoRYIUVtm0Mz7LSC/TTuZETu/PceOtahPw5m+rQCDuO/8qrF925bpxEYOvs
         W3ZqyBT82TUFs5+Cnv55Nt2v3gtqfBcf5hG63gG8kAr0nfVYDDA2euCgXHBfQJSCWibK
         WjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787871650; x=1788476450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PtOQ1ctrt5ChIryejtRZPvf9ci4aQrCJNC6i+HqoyYo=;
        b=gdCWpyHxDHSIquH7tS9S/gFhff/IyYH/aJLU3aVF/4d3z9bbU27TSFqXFyi3RAWRmG
         EcuQP1jjwyv1fbarRq0anX3qhNlAJzeWftbuLU7iNNWjFoC8/2urpaH1RUVst6prih+W
         7ulXqqCCVYyRQjWb71KsT2WZHVlMRnHhO1ai7mRZCA6qvVvY/doDE9V07WP7qmWFms4s
         W5kxmMaeYnCg1Nu5WXzN/IKDzVpjxNaaePefNK31LoZGM0QsvaEmAwJuXdsyrY2bwLZ7
         40OzzKDkmEMYmnre7AgC0SiLEFKNOLpTYlFlbCc79IAw+xI82yfmZ28cCJYLz02zP4tT
         /i5Q==
X-Forwarded-Encrypted: i=1; AHgh+RqxyDHvxJxPy3o3M6kL0fHWH1x72bx8yUVmAGYa8ARGN6AguU96wl86tqjk418J3Thsg22n4Ey7N6+uwgFIzQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lU5eXtmHcsSxOg0Q0sp7CoJ8EcxKxhg3LLkJAAROnyg6ztswSs
	VrG+sO1JiHMO9SbwMF9gHJAOj58EEGEmhEViwJfF6+/i7Nfgzrp7jUmWh/KIfy20/OOj8Fa7jgx
	RnuGM0kmx9obqaDpkrfR3tthSzY71yYg=
X-Gm-Gg: AR+sD12YYqMhmnMF+JLG2RKGsS7JnH1rHcEwfpuo9j6IRbOgpZaPB81V4kdKusRraYu
	C5wW2Bcaw9h1zrNxbFKSvcK2AbuKL5SuBKKKSbPP87G2mo3wnYjxGJOAnMU4yuVJxAA3u5q57fB
	HXH9+tefm/IF4NQ4Y24rmJzQ7mU6AZqvx7Iy6m4oaNEBTpmnJrXawWUe86Ruo0g4GqhyoWFS/NP
	xEY3lcU2G3yuLF52jVSUXkMrH0e3ACe8ZzbsSZfcfWYHqNjZbufz2vJLCuKUugqyAlB+Kx5EQAL
	HJfzw8w9a4lgcWBbOlBFyeqKMimGTikfDh9QwlO2vMYKh74oP1Vtcx1wo0X/hCCbebKJ7xGDBVB
	RgfObkQxP9iVde5WctY5CfLNzngFERjtqXdLjYXhW+rHzexcAYRf5v74I3JQ7
X-Received: by 2002:a17:902:d2c7:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d74ce38075mr21203935ad.0.1787871649744; Thu, 27 Aug 2026
 16:00:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163004.3365-1-mike@fireburn.co.uk> <20260826163004.3365-3-mike@fireburn.co.uk>
 <20260827030352.GB2327@sol> <CANiq72k3COcjo1s1MXdh=K7qRcOMMSq7-3_JCMtNKN3J0zQmjg@mail.gmail.com>
 <20260827182907.GA2137493@google.com>
In-Reply-To: <20260827182907.GA2137493@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 01:00:35 +0200
X-Gm-Features: AcwNN1XMEcBfhQK81kPdbiieX1lImw4sydc4Mu3cJx6g3SD17OlDU5gWr95b-jw
Message-ID: <CANiq72n5swSHaTsDi3TYdneyCiePHF-gEAHuFk3ZWj4v0meR+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: crypto: add synchronous RSA akcipher support
To: Eric Biggers <ebiggers@kernel.org>
Cc: Mike Lothian <mike@fireburn.co.uk>, linux-crypto@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
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

On Thu, Aug 27, 2026 at 8:29=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> Yes, it doesn't explain why they need to be inconsistent though.

It is simply because it is the end state that we want, i.e. both
Kconfig and source code to be in the usual folder (so less things to
move later), plus one normally wants the Kconfig options to show in
the right place in the menus.

> And if the code is "conceptually part of the subsystem", why is the
> MAINTAINERS entry for "CRYPTO LIBRARY" not being updated to include it?

I don't know, but it should be, indeed. That is what we have been
asking subsystems to do since the beginning (modulo exceptional
cases). Some take direct ownership, some request to have a maintainer
dedicated to that in the entry, some add a new sub-subsystem, etc.

I hope that clarifies.

Cheers,
Miguel
