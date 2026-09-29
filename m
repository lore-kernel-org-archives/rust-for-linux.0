Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A19399354
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790666615; cv=pass; b=Ldm++ux+gXlTWLnCUwhsfDvTNHuJLJciBqMWB2CtfTA960wzo7T0dZn+346pYjLXtrjbKjcbJ6Fewy+/ZDMRPW34xaDOXDUASTtfKlRYCICd9TRK2OhlZNbiZOvPalnXIhzBEnvza3433c2M7YBzbWK5a5Gr1F8QUpPReJm24uU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790666615; c=relaxed/simple;
	bh=SwmbR5dUOxUWo+3BAnh/kkUvEjW5wbI0GebbSk6cpTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DnmfSAetYtfHjeHJnaM6KWn9esdCz2hZYwmsyT6hl5UrPZw9jPtczEz66B0d2zc5ArPnk0rEKgPSLReYyl57jcaFcIteUmyt9CBrOfRpaP4i/XJ+ZNnu9dMFQA5cPLcvUUK8xE1DCHGJAp0iI96i7qCyrKhBHmhdw1p9ALZ5zE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1UQShj6; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1UQShj6"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340d23b6a9eso274095eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 00:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790666614; cv=none;
        d=google.com; s=arc-20260327;
        b=OcWa/mBfC3g2UP6OgcRXBOpRGZYbkomjoM6FroaprqQhipqGVy5F5D05jxy78uyZyu
         RKLncoqPzKCDzineD0zNXF/LqpEf4CyVTOmkztMfIZi7xqvwekYxObzn0T4NVEVo6pm1
         IJ7YstghYkQ+B+eUTR6seG+sgRumNtk9/yn5rKwlkgV3WP6VST9ZxZ/1Ol5sM5HcmL+g
         H+1Qa8KmtFbdAtvBnDgrNhtdeetK9HZBlg650DA2smpp000y/Tlh4ATa0JsNe0TNFHST
         SYUE9v7eOR0DLlsU9Sdlu4lgzoxZTrvU8uAHxFKCRdJNI2cBkvwwfa/7qPY7gGOBUgnK
         CCKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SwmbR5dUOxUWo+3BAnh/kkUvEjW5wbI0GebbSk6cpTI=;
        fh=J2s4RY57aRtTAaRJyQpuUSmqOWl2Vw4Qwnx5pVMltR4=;
        b=CEQeHoKG4lzHbq8Fk7mvcK9vUM8RSNHqAetjkQC2Nm15hEziEQKNJW0lji6DrHeREA
         CIcuhXVFPNE641tx+KzekcPb5S29H9l/f0t3bRQo3G8CoQCJVgm26rOGzj4+XeasC82k
         +opXhdtFk9yv+4pUv0C3raOPFRwfY/l6tng6a+wEBnhJX4f1Kmmg47/iIRkG6VVMkjyd
         vaUyt19cxYjlMaUFb0GSWBRP6VoauWFkWKBNQ4X1j4JIhYup6jTQ8S20sVZz/XZHQ4XV
         5EhqILRDGDnyHoSqh8Pb95B1n+d/AuggYHTbNIv67l0RJWLwLUpdl4Erhq0NEo0yzAEx
         iU4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790666614; x=1791271414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SwmbR5dUOxUWo+3BAnh/kkUvEjW5wbI0GebbSk6cpTI=;
        b=i1UQShj6qC2lO20wsdPHUGzLHOxvb1Bcb0wrIrmxdp8aH0+snnAesayJWRxVPlPWH8
         TcApQZdnY6aXEPGS7/2cgya/7fS1NKeNCK7rr28Cwv3R1UMn/j1tCTM3Fql0F7ehlUhB
         W87nkmj5VW7j8fGiiPE/czP+EfaNWXb9RuBW1jmrTEp5iVt83REsuWsvSoiIU3xGIq2W
         qx0SfNViYWne+yFGB+Kne04v8djy0meFkrq4CvPMEKdn1o/IP4u66SAAeg+oMssswYXP
         HZBQcirl+TONYkVBznlB/KP+G0OjW4MsO4zDSs8BkIe5bUJSHSPVDo8ij9ZscwOKk9bJ
         wAdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790666614; x=1791271414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SwmbR5dUOxUWo+3BAnh/kkUvEjW5wbI0GebbSk6cpTI=;
        b=By3nMTBns8CV1WK15fNc47L4rsqiXjFpeb8fOBIx/IE5Na1nGEmnra7VtetKFl7va/
         f61A6nHmP6N3DPb65UuCLf/VNpgk8gbTuIAJjd5YaAT72vwNJ4BD2Hrpy4TGI57+ZBva
         xJrPNDq+bXHInvQl0ioTz/ZG+t65RFWWQnZ2LRBv1Pu6T6qdkpL2/HJfitIsJ1IXC8gF
         dLDiAUFHVrY/PWz3ygdm2+TCg6GBjfcaTYAcb4wUF7rMMRVr32Tf1MxN96/LRro+CsTn
         UUyN53PYmA7x+53pv3O+yjE3JC1SvpIrG8kzr8Mw1ALVunlCAUrfyDriqEh5smiEU4UX
         Dfwg==
X-Forwarded-Encrypted: i=1; AKwUvBw1C+zFcyCFp+cKTEH5ultoJJWHn45EBHjW4PH6xVk7fWnRgnW/WOSi6uM/HJrcxCpsKfdBkrBP3MIubpU+5g==@vger.kernel.org
X-Gm-Message-State: AFq9FYKhHiihWpshKKk0hByZquhhjuDp2yubopAWVo1T7XMTnTjAGjxM
	sUvDVCNCukkkZpru09mzBfLdfctuYGRzp06827nmGP9hdmugvYUxzGF/ilpk7HUN+aBSNbqw+wy
	EWGmjgfeInjQBnLYFPBFtts7CjAid6UM=
X-Gm-Gg: AYBFou02CkpHYbcwwBirZe5bfkWMtF91ma7SumiBiqd0watc/lHSSM9Ibx9M7QPzEYg
	QUPQ65fFt91oeQ2zFi1WBoCL/0GAGQmx7Y98ZmVbipaGNuRWOTEIVEY4vG/2/Sms42cnEoNU3Z0
	iYD1aGaWP/FaV0bso75qm3NY7kc110G3nTtxoK4h0YkYx21RnJTJoiEdkSlnxwdcbq9WL6HQjuI
	HurYbyVU6ycKtf6j+E1hennrwU54VJB7qnArsegReR90WcZndPw+3eDEEYv3qT0JHe3azLUknyH
	3SaaVIKgYC6uvYB55hJoOw7K+OrnALEZiUkPJ9X42GdRddb/QQJToEJ59Sh0wn7NKCTI2BZp/Kf
	xIw8iL00M3L8W/2FgvrZ8Mz+LeRgH9tzK3vab+rhkeeFHwZJ0E6tKttGZUpPVZqQ+NLqv5wnwh/
	xfbWDKyPMoJV4V9stbTKCLGL534Dd/V67zSlDdrdAQGsv0WzFXeQk=
X-Received: by 2002:a05:7300:f64b:b0:33e:4e49:d08d with SMTP id
 5a478bee46e88-34272b4bc81mr19698142eec.1.1790666613587; Tue, 29 Sep 2026
 00:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <GrS88TFpjifccsmrblR3hAxYF6f4xInMyFabclrH0IMtQKZWF3-tOTg-CWN-ZFKrgHY8G2kAArtkzeGOx2k-OQ==@protonmail.internalid>
 <20260928183925.1315274-1-chenhan0017.work@gmail.com> <87bj9htclg.fsf@t14s.mail-host-address-is-not-set>
 <CANiq72kWg-pX36jrJy9M5eKMqRHUT3UUEKTssPwfYWKoseYd-g@mail.gmail.com>
In-Reply-To: <CANiq72kWg-pX36jrJy9M5eKMqRHUT3UUEKTssPwfYWKoseYd-g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 09:23:20 +0200
X-Gm-Features: AclHuK-JOInkMbAtuhvVdW0qLZ7chfVQqmG90mh5JQERQlOVnqB1y0MCUXRo0uo
Message-ID: <CANiq72mbTM89p=ef_fz1DLSQEJzhogdckp07ZiHK+5-53sRF3g@mail.gmail.com>
Subject: Re: [PATCH] rust: time: make Delta division and remainder fail consistently
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: chenhan <chenhan0017.work@gmail.com>, ojeda@kernel.org, boqun@kernel.org, 
	fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 9:20=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Yeah, they should not be in `time.rs`.

By the way, chenhan: in the next version, please Cc everyone in the
`DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]` and `RUST` entries (both
`M:` and `R:` fields).

Thanks!

Cheers,
Miguel
