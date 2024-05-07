Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2EC170832
	for <rust-for-linux@vger.kernel.org>; Tue,  7 May 2024 23:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715123512; cv=none; b=eS/avPiChb4jVV88prPZD27/sahXO6jxwqhXUqqPPK1yCXd8slTWP8T6xUp9CjAkAmNquMkeQ9N5PWsA2Ptgo1sXcxfc2fulgRPVU//aJWjU3HZaoHB12nlW4fWS5mLjxihMKjaJHbQNsvmpF3TC9Yl7G4pwK+qSvTLZauVE6EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715123512; c=relaxed/simple;
	bh=0SX0BNwibUDFZANnnHUBcDt70alMpiFZO4PS8ksCTUg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LwtRjb9rSununCdk0jOtXduXLHeEuAhEwx55i3D1irWyx5/KPBbjtEYRB2sExCBxTJzakHIZASX3b1yDKabPyX8BuX1gTNiFlbr30lsQIZG/qG/G1mm5vg3vaIyqJYxnFHLNYZf6rGHTHj1AmnWogjgbaIZOLd/aJBIEx2eyrEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WRZv8THU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WRZv8THU"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2b33953a163so940965a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 May 2024 16:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715123510; x=1715728310; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qRrUTqNWuWok+20b1PpyiVQiM7lGZB5RKWWXzslyxo=;
        b=WRZv8THUbPjKBxsxmSPAxsbfrwjue4cwtPwsE3V59lMyu4xOnZ4128TRhqLBwllgdd
         fBSbMFjtjNSlDYELC+rGZ759iXHG+EM+fcQSrEQ923e5OykWacb1sd5tZk9z70f2METZ
         XQbi36AfrLLrcjQW7wElDAK9pIfZR7LciEsmz2NHAwwJOgjtLEYfbSPO+/41cHPDmuLO
         4AvljaWP8Yy12OHBng9umRoahkBxn6z4nvOjiYVqMYvwaIVCLOWPIn6DPJtAk3dkQl/t
         usLIl6DV/yxL8zTVKaTpgQ8y7Ha73/JOs8out3MTp5BLaQTlAkIL/1vDJsttpfgDbm4V
         /cSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715123510; x=1715728310;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7qRrUTqNWuWok+20b1PpyiVQiM7lGZB5RKWWXzslyxo=;
        b=Fh564zdGm54e5Ihd4fQBL6FCVaAdlDJTpIAYduR1FlkymZhnqGqFi2MV5HQ6fKv7+n
         PdSbagIwXCYe18g9e3M0WUGs9YR1GhY6can4XaZIpIHl/jkVqeCyyit92KrdWZLmtxMY
         Zh5VWRM30LKhcmu370q+Upa2yGCukI0ACwUtxaYryPSHUBvfoB5xxDJeFUsE/wI4mZ7d
         zLaneaJsfY8Govvcwg+URi0xKLg2YdZzEKlG8bqIDllVT6IPRt3AT++FxAeZvuV9p77X
         LUTFu3dGkyBr1xzAFsS/1yCYghifVxmYYiHwFXI6LmZBXzmf77VIarAgulN9ulKK+sGO
         4/yQ==
X-Gm-Message-State: AOJu0Yz5/LsGRGVz2T8whoABLqQSZFMxtwGNhfX6pHx5HoyLRd2D1GPl
	DRjnwUmxKBju1mdggxm7zfPjLiJHWCRConKKuZTg/sy61NIzPeDROPNJxg==
X-Google-Smtp-Source: AGHT+IEZSmvKL4ztCsDbSKmawL/LBv5Q1FiCBwDzfvustNW+eJty8+Dvl2aUk2rzhJ3/Nn5tO+zUgw==
X-Received: by 2002:a05:6a20:f393:b0:1af:96e7:2bec with SMTP id adf61e73a8af0-1afc8b149bdmr1172685637.0.1715123510199;
        Tue, 07 May 2024 16:11:50 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id g14-20020a170902f74e00b001ecbb0ad6d9sm10634396plw.99.2024.05.07.16.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 May 2024 16:11:49 -0700 (PDT)
Date: Wed, 08 May 2024 08:11:44 +0900 (JST)
Message-Id: <20240508.081144.1308480380091479358.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: rust-for-linux@vger.kernel.org, benno.lossin@proton.me
Subject: Re: [PATCH v2] rust: add 'firmware' field support to module! macro
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20240501123548.51769-1-fujita.tomonori@gmail.com>
References: <20240501123548.51769-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Wed,  1 May 2024 21:35:48 +0900
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> This adds 'firmware' field support to module! macro, corresponds to
> MODULE_FIRMWARE macro. You can specify the file names of binary
> firmware that the kernel module requires. The information is embedded
> in the modinfo section of the kernel module. For example, a tool to
> build an initramfs uses this information to put the firmware files
> into the initramfs image.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> ---
>  rust/macros/lib.rs    | 32 ++++++++++++++++++++++++++++++++
>  rust/macros/module.rs | 18 ++++++++++++++++--
>  2 files changed, 48 insertions(+), 2 deletions(-)

Miguel, can you apply this to rust-next? Or you want to change
something?
