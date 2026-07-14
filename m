Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E02412C0E
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 18:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053487; cv=none; b=AAf8ceYReoNvJ1kukNcK3eF8kPP4otUTiaqyMOpnKTdQkQ+gVvl/bh+IttG0hOxPKabEMb7LDoWxwROv0JGuszEPIRCSKBUK6a1LmnzKJ19dcEOqbl9sMZQeuSWUsWv7h1LWNMBNu3Bumucc0jKwMhU8jznCKc0lDvDcWaeBQCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053487; c=relaxed/simple;
	bh=mExTMvFPoIQPxbTdr7H5tLxu9lj7PhCVhqEt9Ytgyjk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CWPHld3U5ypO1AFDFpGkvWMcKnX8o+hB+5MW4/rs0kR4RD2ar6J418gTKNdSWX0zQGSzg0OrBItHPlZUzEx6e1HrAk/6PRHXPlIA8YGhroMTRQKT0DQwuBSUP8woQx6d4gRRivF9CvFq5Gs8hg2wAH6VNpZQP80mxUyI3jvAccA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U2vqrAkV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U2vqrAkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784053483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mExTMvFPoIQPxbTdr7H5tLxu9lj7PhCVhqEt9Ytgyjk=;
	b=U2vqrAkVu1he9qu94oFdVPKwh5FFhQ7UWDQo28mnvDPkg5eNRoSWkpp0r0EXm5azPayylL
	YGBxzlkcnvpNmBV2BZmTPvHTeOY82IL1PVe6DW3tIrgsS4izZNnG3yivUTIZ7vn737L3Z+
	6o5Egsz94eGaRmKyxASJO+vKdRHtenU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-P5Zj9j2ZOaOZW-WKa3tbkA-1; Tue, 14 Jul 2026 14:24:40 -0400
X-MC-Unique: P5Zj9j2ZOaOZW-WKa3tbkA-1
X-Mimecast-MFC-AGG-ID: P5Zj9j2ZOaOZW-WKa3tbkA_1784053480
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e55721a8cso680279885a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 11:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784053480; x=1784658280;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mExTMvFPoIQPxbTdr7H5tLxu9lj7PhCVhqEt9Ytgyjk=;
        b=gapLIvhhkjKlHZHvIfx/DTgbx2pXFxUVR39h3wvEkoQwjKCx+jCCsSPNiEk/GY0rsa
         UNDljh/IZDQfy8+BPML2wa378kZ4h9+d7aG7xwxarpvBziEQw+glWBjN479ep26nDwr9
         CXa1wjw5i0qXCAPV/lf2+FtjDwCp4f13S5jbRRsyth0WjChMfNcEGfwxTVdhfMlq5pqa
         3u6bjE5NxEaH6+TIEBLHy4Zvk3gVOQD/uic0TwABAsabmMnDvQ06oQRlddN0COOFvuzN
         D7dIpS1hF5T8HDHUBDXRxsvFBBUm6JxboECPBq/ms1dNi6SRNOMIQ/KkTV5F4eBX6N2F
         hAQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1BqRxSbBb5inJ5t8/uO1dJ32e2kHjkw0bk1TqOrpwp1YQ4fMMjvG7b9fDS+VPD2cYuansxdAdHS7C70SaGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYeF5XldcoeT06vuY24Or7mTVXzF0eL44j914B2q/J5WCq92uP
	LO5d5ERMOzCmMfLJnTfx34/qHX33iSz7BtxNPa39bNM7VBqsl9vhiS7zpD4WuZPVb6PuTSJgg9V
	xyozvusvem4AgaHtvUbzTMVr0iLc48gtfL/ZR6FLhQbHYY9Fv8gGgG1rZHG17SsNtF2lE
X-Gm-Gg: AfdE7cl4GGl9QzsMSAVzfeIPiOurp/3n0gUT/IANyckgis9QlF62VeB7QvOVf5WBzTB
	8SlnLYkBKnZ0kEZO8QQKWjjevFRRb8GSeFrSDsTHnu2OLkeJ178ZlEWXZuxHjtzmUoxSPKy2ePO
	4JaANyjc8E/6Bhox6uJ22rYvUGiVjnwBgpp21N0cJaW6yO2bgPpQHHfiiZp1nW1X0hC3Upm93MF
	/raddwmITbwMYkOYSM43a5z0ifIjmf5T+VtnXXd3lFFWDGjZAz2eydNrpyQis1ANyvDyUwt9TWa
	wwLwyz8s8jkf5u1iLBomDPzX6HLx8H5pcEYIIF5ipS334WOI81vXiRyrRswKwlpltt3NR55y8v6
	eDuH8yy8=
X-Received: by 2002:a05:620a:44c9:b0:92b:1233:9a2 with SMTP id af79cd13be357-93083c28722mr404210785a.17.1784053479716;
        Tue, 14 Jul 2026 11:24:39 -0700 (PDT)
X-Received: by 2002:a05:620a:44c9:b0:92b:1233:9a2 with SMTP id af79cd13be357-93083c28722mr404206885a.17.1784053479086;
        Tue, 14 Jul 2026 11:24:39 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b8eebbsm1546924985a.17.2026.07.14.11.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 11:24:38 -0700 (PDT)
Message-ID: <cc22e92456ed6b394f6e49b2cbb5562618f0e182.camel@redhat.com>
Subject: Re: [PATCH] rust: sync: improve `Arc` documentation links
From: lyude@redhat.com
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Harish-CS
	 <harish.cs.ss24@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo
	 <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, Daniel Almeida	
 <daniel.almeida@collabora.com>, Onur =?ISO-8859-1?Q?=D6zkan?=	
 <work@onurozkan.dev>, =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg	 <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich	 <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot	 <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Tue, 14 Jul 2026 14:24:37 -0400
In-Reply-To: <CANiq72=aTZitympw7_LKW4PoD71JfLTVt8EiLcjM5F48pCUjWw@mail.gmail.com>
References: <20260708175119.18051-1-harish.cs.ss24@gmail.com>
	 <CANiq72=aTZitympw7_LKW4PoD71JfLTVt8EiLcjM5F48pCUjWw@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aUR-garU6YodpPDvrjlnYLMp4G-r1Bkxq4dGtOCM9zM_1784053480
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-07-10 at 13:06 +0200, Miguel Ojeda wrote:
> On Wed, Jul 8, 2026 at 7:51=E2=80=AFPM Harish-CS <harish.cs.ss24@gmail.co=
m>
> wrote:
> Thanks for the patch! It looks good to me.
>=20
> One question that I am supposed to ask: is Harish-CS a "known
> identity"?
>=20
> =C2=A0
> https://docs.kernel.org/process/submitting-patches.html#sign-your-work-th=
e-developer-s-certificate-of-origin
>=20
> Normally, the full legal name is used (which may be what you wrote,
> in
> which case it is fine).

JFYI: it also doesn't actually have to be your legal name, it just
needs to be consistent and traceable to your online identity generally.
Though if you are using your real name /and/ you have a last name it's
probably better to use the full first/last name. Of course, if your
language doesn't have last names generally - feel free to just let us
know.

>=20
> Cheers,
> Miguel

