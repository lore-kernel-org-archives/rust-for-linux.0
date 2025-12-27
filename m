Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF437081A
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 15:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766847733; cv=none; b=ZMPiM6FRK+WZ4f+TNOAJSsyvjkgmjEbteEJg+PVuW//oNKLUw990rVhIlGBWlogm1uiNShwcNKTm5UTI2sOcu6QmZYLZKXLcWDWF/PdbnDh3BRKiiqgOJ2t/tvUnQKZjKVlGAEk+qgw3juu1HNgw681T2R63NZ72naYM7r33lcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766847733; c=relaxed/simple;
	bh=ht+wvN7f+9d6mUzpmtIHsydLwyv3boBQN1ot8fUW548=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ej9GDYN5aGKHdXuo3X0kHnY8pPm6vvPuUb3M9VB+exlbaYg51MrP+QqsMiWKUMPcII/IMI387X3QAJx2qd9CkOI7yYGtV9FlabBmmSmuXAOPc7r7p9z13fUYTlZEd4eRAAl3RNb4pDaaQCz+p3PlvPeDuJzmUHI+sqILwRI0pp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2Ug8riy; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2Ug8riy"
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7c52fa75cd3so8560782a34.3
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 07:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766847731; x=1767452531; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pBYlsFK3210OpvEl8PbW73kEKWLAiMby66uW9J0CMnI=;
        b=a2Ug8riy9hQPF4FujZgpMrBr37KxLL4ZOhdnTji/xbcZE03LRQGfQ0ekLoh1P668ES
         HdUCRG5TF5VnGOtUu9Y0naB4FWB3Mmm3+Gob0PKOO3kOhGqKl8FSdWqIzTtMUGVwTv5I
         YVeh6+BP4xvJ+XlepUkHnyRlFFawAoUc8KkK38qauAfXUnZaqWelveca2t72eWp4tze9
         Ir3yYbSI0W5vwPHqTXAl10xtCRoRHMs+BYdhH5iGpNrFnE1ZOZOlgJHIW+B6IoShFZxE
         sh5I42HRdsCrMkqP6nHWrsWkmUnUNTf8V5MxSMrdhrd6Gttgoq2VLBc77hYi54P5IB2N
         LWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766847731; x=1767452531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pBYlsFK3210OpvEl8PbW73kEKWLAiMby66uW9J0CMnI=;
        b=OTW1VWKqF/l5kKYABzfIAslRAjQX4qCl7u6nNP0PsTPzS7gc5aPWObaiiQ765nePsc
         fdWmSPDCBsxnhfkj06qmiKmcx1r6FrvrYkBEszuZ54gRO6kil8R1X/Bd56EV+WKsvet1
         Anjle3NGyWOPZxK6E/Z9ml4XCEce4ROXQt0OKOHefg1RJgBGd8wVAq0NCb8DFEx1WGze
         MUOW/7G+sSpB1KB3xE8YXalepbxDePIvZs71lEuYDhs/lHuAn6M9WSNEtukd0+++7CeY
         I8DMFsR6fxWQ4sa55USNiyynwnHya9mhK7x/fj6vzNNrQLV/ECVcMHQd72v0UZHy25rV
         JW4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXJguCiXE06airrcnlTBiq0ihv/MIY+COnGHttyeIWIuY4uLbtfirf7pIcp/ShzyCoOKUuP6tzuEP6DZNs2zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpgkPHDeY8ymo9zemvajeElNlDHc5OfJpJ7S3vPAxanv9k7Eua
	QVUdlmFjYY+vbIMEYFYvc2d10h2bdR2JjBMwK3cXlrKGqDESMSCdbD7Qnfan9IbqAYJcAg==
X-Gm-Gg: AY/fxX6ooZTZSeT38WrMyN+ujHos6+9Cwz4WmeY5BYEQrP1JKPJuZGA5DpNAYdPdxQh
	g0GNN2s27+UOTmGZf2ampZLpDLIWLI+9KdT3cPKIKrh3yUSzaCxTcIFH5wTmawwBmGWy3EqJsD6
	tXF6uWO/1N1AAa9SinEdmd6+7zr/buKVbv/PwDaWMP/T9I1wRtlMnDDZIWGtgwuxXE6Taw8EdcP
	hxhBz4hlUHFWL8GGl88Ll82TOUqgfY/QZy7a5K8IMwrBlqkcuKfgx3WIHqTIfnWtGYygan0UbHA
	ae/QZO9WRpaPM/Nlnb9W9XpluEb2p/gggN1kI+vM8t+GYN/rWncTU6AbhbbGagfa3Hf69oF61/q
	msEQrlVNYz/1vBDsjNxkSkM1bq30Fciir49bI95c88P7nTYFDiS7DTLE0X8J65gm7CcI70lAJon
	IkhHCa9cbUmAo1ajXTPKKgqYEQAX7py6Wr6fOjlEWBDc7QJxsXUz6TD4PqDS2saeMO08s=
X-Google-Smtp-Source: AGHT+IEzwY3H4Cjmk2RNy1gzfoJoKi7CcHCRt3jXtlnBIkQ9zyhvpnMDHtsSwFS7E5eQ03OxsJVG2g==
X-Received: by 2002:a05:6830:314e:b0:7ca:c7b0:17eb with SMTP id 46e09a7af769-7cc668b620bmr18177515a34.10.1766847730622;
        Sat, 27 Dec 2025 07:02:10 -0800 (PST)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc667f9201sm17105908a34.26.2025.12.27.07.02.09
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 07:02:10 -0800 (PST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3e8f418e051so5504643fac.3
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 07:02:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXu630xrEr7ppDVuWLikURJ4qLVSkg90FKlY/H0ngHbVbRS8CQbJEBE5SxHlduQtpr7KC/cbDjCFVxIYcnrAw==@vger.kernel.org
X-Received: by 2002:a05:6820:831a:b0:659:9a49:9025 with SMTP id
 006d021491bc7-65d0eb0e47fmr7005944eaf.82.1766847729460; Sat, 27 Dec 2025
 07:02:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_9F74630DC16B92484463BBC055DEB1F17306@qq.com>
In-Reply-To: <tencent_9F74630DC16B92484463BBC055DEB1F17306@qq.com>
From: Kari Argillander <kari.argillander@gmail.com>
Date: Sat, 27 Dec 2025 17:01:58 +0200
X-Gmail-Original-Message-ID: <CAKBF=puTwJhNVhV=_N5m-dV8CRfkW8DpsAsC6i9zYxVZL_nQjQ@mail.gmail.com>
X-Gm-Features: AQt7F2p6WKH4peoqypSmflruXyiiN6pJapuKS-RpVSKawPEerob-YZ4IX0nuRys
Message-ID: <CAKBF=puTwJhNVhV=_N5m-dV8CRfkW8DpsAsC6i9zYxVZL_nQjQ@mail.gmail.com>
Subject: Re: [PATCH] rust: device_id: replace possible incorrect word in
 safety documentation
To: Yilin Chen <1479826151@qq.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Currently subject is

   [PATCH] rust: device_id: replace possible incorrect word in safety
documentation

After this is applied it does not make sense that there read "possible
incorrect". So just remove "possible" from subject.

On Fri, 26 Dec 2025 at 18:09, Yilin Chen <1479826151@qq.com> wrote:
>
> The safety documentation incorrectly refers to `RawDeviceId` when
> transmuting to `RawType`. This fixes the documentation to correctly
> indicate that implementers must ensure layout compatibility with
> `RawType`, not `RawDeviceId`.
>
> Signed-off-by: Yilin <1479826151@qq.com>

I have said in other patches already but just to be clear use real name
in signed-off-by line.

> ---

On v2 you will have something like this after "---":

Changes in v2:
- Changed subject (Kari Argillander)
- Use real name in signed-off-by line (Kari Argillander)
- Link to v1: https://lore.kernel.org/rust-for-linux/tencent_9F74630DC16B92484463BBC055DEB1F17306@qq.com/

> +++ b/rust/kernel/device_id.rs
> @@ -15,7 +15,7 @@
>  /// # Safety
>  ///
>  /// Implementers must ensure that `Self` is layout-compatible with [`RawDeviceId::RawType`];
> -/// i.e. it's safe to transmute to `RawDeviceId`.
> +/// i.e. it's safe to transmute to `RawType`.


    Argillander
