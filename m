Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6054C7482
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Jun 2024 04:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717217508; cv=none; b=f+Zvi32Q2bpc0gAesP+m8s0/gzvRW1S3cprf5wndkdIcShEOg6a22EuIVvxdIcjNdqVGsBC6nLUcdOTHa8TKHpjQv8ED6YoZUeoKtABvf2hxG3hV+NvKmYvs4EwZzO+gY5tz+P7YpS+0xfUy0Z6CZytGx9CkIYu+gd5Y6TwMhxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717217508; c=relaxed/simple;
	bh=gfwQUjf8HBR68jWYyqkbyvvgKQw98aYpyrXY4LbvnXk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=HlucsWkcmdYzwnu/t/eBnoyBym9r1VXAinH+EfZ+PqPQoZsoGTiF6MnMkQX35xzxhix6a8YLwjpUScNIxzcmmJ8ngMIOg+LdiiCbLHUl1F9UCoVXsfkjIMTvAUIHmKDoC37Z6+9ar6DPPQSUqusfwI4NAgYnWjE8wUHTotZcO90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=inTSuQ5G; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="inTSuQ5G"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b2e8d73bfcso290462eaf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 21:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717217506; x=1717822306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfOI88RXcmRkKQKcmtgWEYCvR/hNGygw3QGJ0O3R6Cs=;
        b=inTSuQ5GZ4KFC73pZxzTsJUOG5bQtMCRc6UhtDw0Q99KLRI0Eqy1rd4u5aQAbPbtSL
         HRFN5hQfSyKkPDSGb+NsLVXgTAewrA6bB9SWk6O/Dg2XAPWHhKeSEFJqRnTOu8rgBmgx
         ce+EmFiVrt651NEO+rAbgAaSgNfShhyyYwOA+nWu5v/sYmiifNUx89Ql6vaNchr8URrz
         0f/M1XaHkIrs+ahFkt/gPEigstsoM5t/taFPduAsIWW4FSZ38EBmjfxo0WOIqcz2xX4d
         iqJqwXfY1UD1QWONleJHheiA48ilYC1Lfnau30R4unzxN9z3ynXRfvS4cMX6bZ6RoCiz
         jabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717217506; x=1717822306;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XfOI88RXcmRkKQKcmtgWEYCvR/hNGygw3QGJ0O3R6Cs=;
        b=fDk1gGncQ+nXsk3J4/yiD6YVO3utD145RICyjFyI7TcWyFw89sTKz9D8Z0Fsjx1f9i
         9QTVRSFKiP8hTp6w7R18QElDSNm549O0i21tVyptiDQMdnoJRVuLoJHmpmqxq2D4nGx7
         /4FXI4H0A3lqeBUtsyX7WRL0cIG2m56L5/639n46MCqUkcFXQ16F7jNuApVM/jtjTe1H
         3Qw/jUTN/zFCHWFM9vNrYvSgAyRJ6cgKveRDAxm7vhz9cWytU9dC9U7FQtNvZagaXI/+
         gDCXJKyp5DHr8y5Y1LR0gf1YQ7vBC13eJhNncCHGrNDeZurVXUs1glTGpfbQzcOM017q
         T1nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDorWc+fSx3fP4u8P0ODqMDxcTAGwr14cUedTrRDtzmqBiyCucPxqD/zex3jDkFTKvVgAnmvtxw2Wh68u4Yvrpqb5Oj42jSVJcOJxyjhI=
X-Gm-Message-State: AOJu0YwPxkFiROzyh08pura7kmftUYLiwfTF+o0SuIBvRIAqfouzk9/3
	BRoANEWr7vMMk63yruIGbYQVSfkKxXArQ5kuwpp0/kANkKStvtwR
X-Google-Smtp-Source: AGHT+IGyZKWE7Jv1WVe+mwfYQqQlxEQSMC58rN8028tWIKjoKG+BzrCS2IsRCtPdkbn3VKlm5qOjUw==
X-Received: by 2002:a05:6870:8327:b0:24c:4ab2:7f9c with SMTP id 586e51a60fabf-2508ba3e963mr3939247fac.1.1717217506395;
        Fri, 31 May 2024 21:51:46 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70242b05932sm2343806b3a.174.2024.05.31.21.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 21:51:46 -0700 (PDT)
Date: Sat, 01 Jun 2024 13:51:32 +0900 (JST)
Message-Id: <20240601.135132.1027202187900417203.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, andrew@lunn.ch, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <310b155c-9f06-4748-85c4-cd8c87f196c1@proton.me>
References: <4a6aba6c-3e52-4ace-be88-58f9c1b44693@proton.me>
	<20240531.225857.1252492134294581333.fujita.tomonori@gmail.com>
	<310b155c-9f06-4748-85c4-cd8c87f196c1@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 31 May 2024 14:04:18 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

> Hmm I guess that it probably can't infer a default type. In that case,
> you can also try if a struct approach for C22 is better. So:
> 
>     pub struct C22(u16); // choose the correct size

Thanks, I think that this works nicely.

>     impl C22 {
>         pub fn new(reg: u16) -> Self;
> 
>         pub const BMCR: Self = Self::new(uapi::MII_BMCR);
>         // ...
>     }
> 
> And then a specific driver can declare its own constants.

I uses const generic to declare a vendor specific register in the v2
patch, I've just sent. Please let me know what do you think.
