Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795536537;
	b=2N/mqWnSg+35PyRzUDL6eKbf2INRjmona2q3Oi5BiKY9evD7/m2KAOktKxuAJHShIxj4
	 7slM4gaRkw7iQclkw9NdAHZbzbQ+luMcmuhP/7+ufVF3sbRbWIw15RXpU8W38edQ6QVlU
	 e9EUDx4eCBSnDI7VMG+Fo3Ziki9iz8xF1b1UhWVISpGS9+dZ+P3UfjzdKmPOc+s1YTqrJ
	 x59vMDoyoXy4Tjjubpe4Oq/D/1EuJpXKjKRya3MJc32AM9l9xkeWeL3siHrLLCDW1miRV
	 lyurcVZmGRnbsXovaycniqIRy2zwS/B7zBwRLdQoBhbQrBjHWhNhGz8yoCEy8btKY9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4UgcWRsCb4mUIOkDjeLEf9a0YeOGLtlevrvEVJAD40c=;
	b=vEt0zF10Vs8ZGsNzy6tL3NiTvovoFJPcWkPXyPhEXVIXDY8VeUO7bn70e1PD+ho03uBh
	 Ust0J6DLKyCMT9ClH/QxK0iY/VXujasFTU3JlFOIA8sbMmMNXnPIH1/mpyvd/kActp1AD
	 WDTvTDbrgKy7OHGEuwv4sf1f/1lR79de9JWL7FHsl6hjYiMjl7mxdS5lMmgltyLA0WqnJ
	 O5/zlZrSvbqH6IBe3PBSLh7ePP8p6pr1UMozWUwkXU+OgODS06RQhzCMHk02hCM8Hdlnc
	 cGLLnHOk4nQrox9Cclu0bcZgVVUkbVcBqa4zL17kItP1dvzfqL9RztJU6jlnwin6nyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WizQ5ri6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.49
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1EAE606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 16:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1EAE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WizQ5ri6
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7d2e43ff4b4so3965097137.0
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 08:08:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795536535; cv=none;
        d=google.com; s=arc-20260327;
        b=XM/ZeSScAIbvFeB7YcEApJyOlZ4/iF1dZu6p9udITeSwlcxg8qoX93+cGpKBAvjDpH
         hcLccWJxBKYEzghPOTD7MPKSBTWuZWXSXEvhsQHkvMO0iM3UqotVgrNT3KM7mKnsx6tz
         9pMG7zs9TwqJ1dkB/Xql9TPiueHuN0xv32UWeti8uY4rqyoHHcS9OQC91LhObPOtQT89
         Optqrm3T4Mu7TCKKKik14FfdhbNvcRsgch1X5jHxY38q0DWz2dkZaR3Gbjv41XETlS04
         ZqzVM/VBATN7AHpNNw4q4Pj/dOzmDmojqvcryHJnXrjuT2KnHDvLJi/jq2XRFlgmlBQO
         zS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4UgcWRsCb4mUIOkDjeLEf9a0YeOGLtlevrvEVJAD40c=;
        fh=R3I5E7EfTYhygX1IMO4JyfPwnL+VPZABjJ3lcUYma/o=;
        b=d2iwbMqCCS0grWS4Ub8zctyv8Qga7TY4DYnHDv/s7n5OlTqLT6h+M06wetM5cJe0yl
         01+iQ1r22yR56mI9BErFFyNSJyhbXt11mpp1sJ3jMLxb2Ro28sg1csIDAmNSCohXUBU8
         wwrRy057tiU9I0ce1ggODMp86/r+f3x3ajGpZInFSSPD2qSI+gCOyKy3XKfgdUw3KLa3
         Lb/rRbPltzt42D+0ZngZrSulC+em6CdB2rHDdPnCKc0vT53SM3FHrIBluWan4+fmM8dS
         MAr3SvVgxr64TYYyGM7wIofu00W+IoHEerc04Ue0MEkG5vC/WWJTzllOKDcfxEYphz5E
         QwmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795536535; x=1796141335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4UgcWRsCb4mUIOkDjeLEf9a0YeOGLtlevrvEVJAD40c=;
        b=WizQ5ri6+9Oi41QRncS6krd24WHr/6yrwCefLDGuRXBg9L/wGA+LDI3Qu3bdNTYJB8
         1qSD9TqhaVwRIg+idf3h9A4d05ZLdpsY4WZ9RPcvubyFBtbNjFy6UOW4fc4Iynriqt4i
         tcMyzvqRfxfXCwx+V/+DJJrcyFvpbU5wuixXFPdyOs+oJ9Wxu+5/ttgvHJ3eTAmvmrpI
         IcViRXF4lT7Llb0rnnf+6yl2jrVLwwwLcojckiY5/BARNZkGMylEslfECX0TdVyJG9YG
         WjWRg/j7M25OxFzzC4PbPF7Sh3GRK3C4654ThRg9WK/Kdz5Ze0ilRO7z3hBbSUYd25q+
         h7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536535; x=1796141335;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UgcWRsCb4mUIOkDjeLEf9a0YeOGLtlevrvEVJAD40c=;
        b=pKsEv8Zp/xI3WJGxMJ8L2xsowscbFjaygvm4F5Kqc4THXU7ebtg37Hzk5gY4WtrGNn
         naQ2zjzLKzIzquYUVwn2QypnbHK6SeI7RHnj8ZwqVDW3AfaVLcIqVE31B4GL25Wg4hut
         m0TX+15eEsjyiTs4qxBj3EHTAGrPGyLYAV4p7a2nth80N79Q1tB691xYGNFyVbrK1vql
         1sjKbyxDw3Gal+RPEKB8A/QWwxxpoyozeHMuhyULrygmQFuO0hWIHSesnuuR5GV/iuw+
         YpPri+mx9b/POH6yoNfD19j5LHspJHeE7Bj6wosR56Rbsb3lRbAwiGBN36y67mvOV2OQ
         uZRw==
X-Forwarded-Encrypted: i=1; AL+hErG3nLU/YdZvJ/jRCqwmin806KhUYvld7NZeIvyuBXkiHbk8e6w5Jmi7qx8VKqgaW18bvqZRfdCHmUmRvNXLGQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DLdSdKDfageFCmlb00f2yITyVAKoHoIcVlMVyYIL7SkNVDKG4
	yxuAqCpi9lPkQ+U7fiVmxO6aCq19j0ULnlSfHq2OgLiT3eMEwxRIHKl234yZQqnPcNl/HEyszTz
	GwlwUo4Yzhjgmy6+RaSrRJV+FCCmSBvc=
X-Gm-Gg: AZFdTZe6Ixxnvg0ruM0y/cf5SQtt5IUpPSqPqqGSAH/ZtD0SiCMCh50KUcTcjaLUqVC
	zAFSAM7tGiD0uGKUq/EmT1J135vxywft9TX2Of9rBgyIXc6uUysQ+Ms/9qYNk2wVJ+cH0sIwHeV
	unOAP/x4lhcN2VWqcMl6kTzwqOO+2dGmy0a3ItwKiY62nO6NSIY2x7w1QpPyskZK28tMB3x8pTq
	hR6v46Bd4lAzPeQZgyrhclzYloD4H71l/xyMpG9X/EcprX7yjxn0eLiUHkz/zjS1UcDkBU+5eg3
	SlYRbHu7wkTL6VSPR5Y+01zqxX/S/GtjdVfc2V6Xh3jwQXTp0LskcAv8gSg91DZJzD3P0YxfGBf
	Js2/m2fhor6uNIJz2+89EjBr2uGR6GLIuUw9QzA==
X-Received: by 2002:a05:6102:580a:b0:7ce:a840:e736 with SMTP id
 ada2fe7eead31-7d739626308mr5326904137.13.1795536535526; Tue, 24 Nov 2026
 08:08:55 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-rust-workqueue-safety-comment-v1-1-48e4f9b35c30@gmail.com>
 <CANiq72mZhkbe4J9r3-t9akSLpLY5HBwxGW4c1RqCWghobbpsxA@mail.gmail.com>
In-Reply-To: <CANiq72mZhkbe4J9r3-t9akSLpLY5HBwxGW4c1RqCWghobbpsxA@mail.gmail.com>
From: Andrea Tontini <andreatontinidev@gmail.com>
Date: Tue, 24 Nov 2026 17:08:43 +0100
X-Gm-Features: Aa3M54qOnAXeiyVzegNhCUizvQ2mePw8oQv15_4CM_MNqONsehrqtAZ9axJ5Ja0
Message-ID: <CALP2iM7oZkxJtQXfXdSktTsPNTJ1Ta0OB4EHHq7kQ03HTOx3Yw@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: fix SAFETY comments in Pin<KBox<T>> run()
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Sagar Taunk <sagartaunk@proton.me>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Tejun Heo <tj@kernel.org>, 
	"Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Miguel,
thanks for the feedback and for pointing me to Sagar's patch! I'll
withdraw mine in favor of his.

Thanks and apologies for the duplicate!

Best regards,
Andrea


Il giorno mar 24 nov 2026 alle ore 01:29 Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> ha scritto:
>
> On Mon, Nov 23, 2026 at 11:27=E2=80=AFPM Andrea Tontini
> <andreatontinidev@gmail.com> wrote:
> >
> > This patch was prepared with the help of an AI coding assistant (Claude
> > Code), which found the mismatch and wrote the change; it was reviewed
> > and build-tested with CLIPPY=3D1 by the submitter.
>
> Thanks for the patch! This would normally go below the `---` line
> (sometimes we do mention testing if there is something in particular
> important to say, but build-testing and `CLIPPY=3D1`  are always
> expected, so there is no need to mention it, especially in the commit
> message).
>
> Also, please see this patch as well:
>
>   https://lore.kernel.org/rust-for-linux/20261025114304.16730-1-sagartaun=
k@proton.me/
>
> Cc'ing Sagar.
>
> Thanks!
>
> Cheers,
> Miguel
