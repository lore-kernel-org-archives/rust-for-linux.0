Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512D72FFF94
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 23:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762817097; cv=none; b=YE9q0WZVyx/9N7D5YDo7ztxljN0N5WXN85m0h2w8sHQW4haTdMlygaKyY1cTETIa9+N3Ilmny5MxcEyDgKkcdH1TMwZdBLQTmbQ3hMT6ZIJE6YAkRKfbbDQukYuIpVvL4tSgDiVHy7PhwOA8CdYGfMf/7O7/5CmIebNly/aHcQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762817097; c=relaxed/simple;
	bh=LfgMc321C2gmcbEJ383Vf+rgHpae4BVbOamwU+8oUxk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YRCtZUapsdEoJtFijJ2OPzDDMTvSCOmNBYxP18Iil23vupnRJOpDmMRyzR3r2iAg4+MPZ87IFdmCfrj3A9HDZAwQF+jYruaICQg82lGy5WaiZzh1C8AMeVmMNTWn+Y1645uAvAaz4ottvvmBBpf2Abq6k56V7Crr2EDOjnHGJf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUMhSl/y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUMhSl/y"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-297dc3e299bso25871235ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 15:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762817094; x=1763421894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB+sgp3H4KhlCjjfdfflHKnV1BKdMwtwK7bRa+WX+h8=;
        b=NUMhSl/yWrmfhdHJdX8fih355M0vD3HaxKpbVlgg92iS8OdPmXRoQTxj3Chn08DduF
         fLeJ2Z0hRlSivSJHFLxZq/9jYEf7acz+qIrek/3pBCkBggns2OypGaXQJIOV6zKF2DFD
         3/VyInLtLJbynuXA5BT2nHR03dOhxGIH+u/w23IhcGUlqlnNdww9AGb4AOoQK5Qcf18E
         T9L5mSVa49EdF7y2xTpOujSgjpGyDRPSGzp/6NwwUfGv73tYoSHfeU/afKlvUN3w+c1r
         CbX0vx7U94T+a3o5d2CvwjknEZHNoxAxB8xDwM07ZpWYdPgmpEb+MMYIxStTPNhaYuz0
         OcuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762817094; x=1763421894;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB+sgp3H4KhlCjjfdfflHKnV1BKdMwtwK7bRa+WX+h8=;
        b=saEm6TetuOIbbYNKg7vfVEtJtlIYLibXe6wa9wQEM86RL9chpZik6mVxRA3CFypt2a
         jRwclHfNtFcnK8UoaFN5pAv6F3czKave0LnRLhaTa/2zcGLYhoowF78+JQqNFS5ISbmb
         R3bK4dNro17RmPwuRvpavv/b3CpBsG+5yNn1D/2xit1OcRwIs3/h14Alcl2Bn+/403sI
         J2846418hH0DElBn+NrdvoLgqISVgwMgx8fiSX+Hmj1iHQXFAzfDzQD3QMAkvmBAz3jn
         Zc1z5MuKj41SjsdGytrktHma+wIRs2oEl18z4uF1IcAfg1A9a6godA5Jlk8JADma2mvd
         mpkA==
X-Forwarded-Encrypted: i=1; AJvYcCXhadT/teEAm+7JJZKKnJSOmLR09k8FzZnI1a9cwgsuUI6A7FWCezdFO7t/KDQsDpIiwqxEIikWZg27zeDf8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2WFhchr2KnzwcR4iLefWZeNidq0CaKp92clNqBxwj6J4W55et
	1olmoCOsLmvGlQcb3WX6JdlsOvBfr9mlsAmBPzXUltWu5Qf4piM0dZ2a
X-Gm-Gg: ASbGnctRwMW+4WpPBV9ZdtvXFHYLaL4+6Mbs+JVml+pr2xsRBgWTskeJ/GJYzfI4lHt
	ajlFc1glsdDDQ1xLrEwDJDfuevWjBiXY5Y6ANLHa++Y0wWUNyQQcJugQtC9NYpPnIYvXlcRCn7Y
	rD/+vbP2toaRLIsypPCxmRXAM7i19CecaXwxxyGVNBRWZsXP3y+2ENxtFqO6h8KkeiE7pRdpbxx
	jNqSwBIyyMdWhduPM8CTMnXGMoOQjiKsMa9Fai0cHFPH7ddWQ1PTzDqumnJcQAg6IdRd1n5ZlOD
	izEjwRJZYkrO0nM6dAo5E0ttDC5xLUnJIVTvbuQi1QecNTKJm29NOUh5sEQteM7dvWIZFFsPGAx
	7D8GBHuZ/viRlLKU8G+OAUzwy0ttqS7gLJu0SrndXi+nNo7useGF/nEDbS5d0pnwvFUE+53baQM
	ALD4gldaiatf9Mwhtx94VEhw6342mb2ftDS69mB5+6ut0L61VtbN7M68po6iNc7wed
X-Google-Smtp-Source: AGHT+IGPaBk6e9Khb1yqRKfYMFmfSNYwn1VnFyXe0wXMOkJC9R7tqlKr6n2Ksy2ki1vCKQog9xKolg==
X-Received: by 2002:a17:902:ef02:b0:295:a1a5:bb0f with SMTP id d9443c01a7336-297e565d7aemr118857735ad.18.1762817093570;
        Mon, 10 Nov 2025 15:24:53 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c30b96dsm12092310a91.5.2025.11.10.15.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 15:24:53 -0800 (PST)
Date: Tue, 11 Nov 2025 08:24:38 +0900 (JST)
Message-Id: <20251111.082438.1117005832484432168.fujita.tomonori@gmail.com>
To: ojeda@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, tmgross@umich.edu,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 dakr@kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH 1/3] rust: net: phy: fix example's references to
 `C{22,45}`
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251110122223.1677654-1-ojeda@kernel.org>
References: <20251110122223.1677654-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Nov 2025 13:22:21 +0100
Miguel Ojeda <ojeda@kernel.org> wrote:

> The example refers to `phy::C{22,45}`, but there are no such items --
> they are within `reg`.
> 
> Thus fix it.
> 
> Fixes: 5114e05a3cfa ("rust: net::phy unified genphy_read_status function for C22 and C45 registers")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

