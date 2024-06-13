Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE63312D1F4
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718301632; cv=none; b=LHiJ7bpiLYD7j6s676H8jx39Hbxl6HjGt+L33WNox2gHruUdesiwPs78ztSAgsrC/iQAU4eDZSILLokmZJ2rxQpBude1paOnQadNTZMesGm0tpXiL8dEJfkqPfgahUHXMiuhrpmOvzVBGaXf3u9Zr3RgYPjzPUuDFqZTMw0tjvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718301632; c=relaxed/simple;
	bh=KIxYCZxky4LIq9N2MrGF8XCDHlu1RDhJ4fNMn6Ih6lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRQkT8CAVTTLonVqcldikSyr8n3Ho8B0jL9AlqQpxgG6sLgSX03Fw1YBd38/ahRwgxLBOWCy0+HSZ48UZr3C7/xkngF7/MLjIj4IoCAUNVeBIYbtet/p98g+//+pnZdIjJd8PVB25y/BdXV9UGuqLpBvHVhwDukptQtycdpdMQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=Ry29gjiX; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="Ry29gjiX"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dff0712ede2so1202150276.2
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Jun 2024 11:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1718301630; x=1718906430; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIxYCZxky4LIq9N2MrGF8XCDHlu1RDhJ4fNMn6Ih6lM=;
        b=Ry29gjiXf/iwVp6KMSm8GPo2c5nKJEfy/mLC0qHqVdtvoCwkpZbMj678Wkuoo/RmdF
         H9zyAQKyAm/jmiQCl4V7SPPvgQEBTlTEPUvOKedLTUjOuzuaXTBTSL1b5/T7unEyjXjm
         6xk2V7P1TpzJ7P2fTFo2/mGGxkx7jKOPthqmx335EoA0nJzNOGzU+a0Wj597In4zKeaf
         d5qROKhupBtUS/B9i6OyCzZWzsaPhTTK1p2TVxTEB4lTeluzkZPBxi7s0DQXbWyU9Fli
         vKmWsBoWtoa/mJy6lUxL8aJE+rgOlTnRybBq4l8yGB6ACZzYRbGiKkhngQxmIylpIQLZ
         gfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718301630; x=1718906430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIxYCZxky4LIq9N2MrGF8XCDHlu1RDhJ4fNMn6Ih6lM=;
        b=ZSZfy5f0hJxUpIRfwi9NY08Bd23n91RHWU1n2Q+IcD8P/gbfyD4rm3c/PAtf+hoVzs
         iiqopwzLiUXh392k/5PE4I2HvAheGFck9OeoT4VTm33sXG1D1HcKNTTJbVccwoUqaGek
         l/BORnUlJqW6nA4fij8jf66RD5KLme91sOoOGzm18IPlGxhu5CkqfgAm5S7O6lpdxCae
         9hJw+Z9IDFtwNNQfsxqHBGIbkRet300lWnJIdCEgvvXAox4m8RlD6kqLawLcuV9DDqUi
         l9wreV7/simXdZDrGBIqDlGAw5yOP9rimzKBjm5NrdBFBM6PY9V3hiq9lF0WIHdFkhBD
         Pa6A==
X-Gm-Message-State: AOJu0YzkyTVCqNBNz2z1X/4rXBtlN10C6c7UcNGGSXmetIpVfIRNtMGI
	uzpOuPVpWNeXCRIWr9+BBGPpbvhjFFCCFJQVIQuO50ck63iX4X/XMV+OHPygSlChpZgwSKjajvO
	ctS/BX7CQ2OwTBJ4XpmzZjd2L1hmzRLitOXcPYw==
X-Google-Smtp-Source: AGHT+IH40YJJAafPACacG5K1ir7hVn41gm6516ova29SoKU/d8Xv2WSocBs5Qt49GeK2ciqcsIByQ4oBlssKRC6wO2Y=
X-Received: by 2002:a25:acdb:0:b0:df7:7096:4097 with SMTP id
 3f1490d57ef6-dff1534b75emr244650276.11.1718301629827; Thu, 13 Jun 2024
 11:00:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240607052113.69026-1-fujita.tomonori@gmail.com> <20240607052113.69026-3-fujita.tomonori@gmail.com>
In-Reply-To: <20240607052113.69026-3-fujita.tomonori@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 13 Jun 2024 13:00:19 -0500
Message-ID: <CALNs47uno7eE7nzJPLCxDqahh98Kr9Y2RWNeXtGOvknOCER4iQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 2/2] rust: net::phy unified genphy_read_status
 function for C22 and C45 registers
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 12:22=E2=80=AFAM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Add unified genphy_read_status function for C22 and C45
> registers. Instead of having genphy_c22 and genphy_c45 methods, this
> unifies genphy_read_status functions for C22 and C45.
>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>
