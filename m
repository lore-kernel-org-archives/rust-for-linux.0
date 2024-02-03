Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572475FDC2
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Feb 2024 20:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706991996; cv=none; b=Cu22ucSp/oT2f6632Me0O/CkWsSIIi4IeXnVH6YnFfIodmyraiy0dejy3j9mH/chXiLj3GIe6INJcwhV6vQrbbhCNi6UXL9v+r5NM8g7iEx5WWUYYnZA1DWnUveWj4t9MqEOzLWXeqZlSWxwkZWt36zlnnWDAYACdwzHn66k4W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706991996; c=relaxed/simple;
	bh=INZTvVNvP8YiQt0FAqca+bgRNRSZAQ19QBiEt4zhokQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hYpWlyAUNobFfSz3vBi5M+XR7o3l6uB+65MJ197a/MGGBoWr221nToBG/FxWtp7oPJQbxUZ5Hiq4UWYnCNpv4hJ13D5duVKUPNc62lwLK2jX63Y3VRSVrMY5kaGM7pyp9CYxJ8wwgqdpPcIXF+ZIJkTXUSaD5ZN8ebGCcbCXQtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4vE6y22; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4vE6y22"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7beda6a274bso126305139f.2
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Feb 2024 12:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706991994; x=1707596794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=INZTvVNvP8YiQt0FAqca+bgRNRSZAQ19QBiEt4zhokQ=;
        b=M4vE6y22NTnAUc90ut6HGMTf4qGShrsKi9J1G8FX0iONfHMTZ+CpdcIp9x0Dwn+aN0
         3Ql6KWQzXCkG2J0Zdt7LOsa55vURtP9WTCd3M7eMYMkm6ka9M40CeP3AwVH1msl6oWJe
         ZNyI1y9DkPZAtd0PyCF+dfKRtoUQeK1M9hzBX27evP/1W6qUWE3AqWs0uyQ689igZgMS
         ryyGKpU7RBMZVWFYrh4wiJBUbthm+cfAMK35YGvlzYDm33s1bJlB978kPP3HKm2nJqVD
         OOALAER5dWDrJ/N0o+CvAsKSv1GD7sVZIAtCGVveg8nZgefbsfUmV8+c81MCHHUsDhm9
         3fmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706991994; x=1707596794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INZTvVNvP8YiQt0FAqca+bgRNRSZAQ19QBiEt4zhokQ=;
        b=bkb0iRPwXSuYuUWPwkJmO6W08WwRYbtd10XL7ugICP+r+tkY4tE4+hxs7iOfMKRUZa
         b53DgPXcIqShhZlSmLDlFfaCNFyGC0of2Jlze2IPC6LmLF61OiF2n2IQblPXDah5L6C3
         jEkuUHsHgOVhZx8AEtYgPo4J91zJiS8YYWrFIKwrNMazj6DiDMDYhvIu1cgMmHlIHEFA
         bxjhypQTU4UhFVt4PlEYIMW60LAV2W0q+ijc8PzBI0S5j5NtRfsNSMJh4+0bMAEZbJ3f
         V3qYsMpTyzu2WNTIKGTwetcbZjjbHX6I8vSCARl/jStgeetAIDZLsGX8pSb8xwap7MZo
         43ow==
X-Gm-Message-State: AOJu0Yxi4TNzr+8z16hjT9xe2wgVcb7fajCl42GKxHYxDPBxGajwqNzY
	JzF1FKSC2RtlsqMEy1On3ULOGMtJqBSI8y+0NsBFNzDCn4yrbt3rtuwzhPRiuaQ=
X-Google-Smtp-Source: AGHT+IF9zHWifNG3+00huVoRB9amz70q3yVecMKxTnJPCkRHf/GCnKo5vTPoZXhOpkgQKY3+PeCjpg==
X-Received: by 2002:a5d:804c:0:b0:7c0:94f:8195 with SMTP id b12-20020a5d804c000000b007c0094f8195mr6596146ior.11.1706991994232;
        Sat, 03 Feb 2024 12:26:34 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXo2D3ymscro00T2o2fN2DWA1w0YYCxJsIY2mxp0Fxb4Td6FtO2dvnEsXPlx/d4Q5eUedwLvr5Yc1Sb4m8qMhZb99bGKHG272zqbeupRFizhA6/FvezbmS42Uh42i7+ScZZHA1Q/b0VYzh20A==
Received: from fedora-laptop (c-73-127-246-43.hsd1.nm.comcast.net. [73.127.246.43])
        by smtp.gmail.com with ESMTPSA id w25-20020a5ed619000000b007bf0e4b4c63sm1203830iom.31.2024.02.03.12.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 12:26:33 -0800 (PST)
Date: Sat, 3 Feb 2024 13:26:27 -0700
From: Thomas Bertschinger <tahbertschinger@gmail.com>
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com
Subject: Re: [PATCH] rust: place generated init_module() function in
 .init.text
Message-ID: <20240203202627.GA296718@fedora-laptop>
References: <20240203182735.295946-1-tahbertschinger@gmail.com>
 <492b7c1c-22ae-4464-98ea-000889301375@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <492b7c1c-22ae-4464-98ea-000889301375@gmail.com>

On Sat, Feb 03, 2024 at 03:50:02PM -0300, Martin Rodriguez Reboredo wrote:
> In resumi, to call `init` funcs in a module you must do it in
> `.init.text`. Amirite?

Yeah, well, I'd say that's needed to do it without warnings from
modpost at least.

In theory it "shouldn't" cause any problems to call __init functions
from the Rust init() even if it's in .text, since that init() should
only ever run once. But then if anything does run Rust's init() after
module initialization, that will definitely cause problems. I don't
think that should ever happen though...

- Thomas Bertschinger
