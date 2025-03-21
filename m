Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43CF1EA7D7
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 19:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742583680; cv=none; b=ja0meJwsgyNa6VQ0gF1wiXABD2mDAuvGo+8shAoN28CrsqOOonBWFWx8KJyF12zwtwPIKG5rjDdFzpKrAfJQplg4LgPsdGvn64ckXIbXT2YDN0VvsEmLcCWBxQ1EGblBMu2NwzYmt2QI7XJg4gg3k5c4TIBIFnFgAijjLwJ+te4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742583680; c=relaxed/simple;
	bh=Bd3W8zmoA56286TIT/M27tLloKuTGWvB4Py7sj3zCIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KsAktpb3j8QKyBGKc+HrDY9SWh2ijph4jPoQQV0GICPl+C+EtzJ6qEo0uQaD9h0cflum+0XogfK98xb4DHt9mQXSVsb3TbggkIhR3Uml5fLXvgg4JrOBHB+HPZknfMsVm4ikR/xyjlWGcR2FxNwoahoz1bvm0jVIsBR9XuKvT9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=eLv4wdMf; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="eLv4wdMf"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-700b17551cdso21471757b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 12:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1742583677; x=1743188477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR4lHmAwKxP9HyGmUTHKde+Eo7V+LJcGUFHENv86AZM=;
        b=eLv4wdMfCHT/qkHUpHNYlTw9jw8y4tRKA50OqcnETlj1Xw8TQg3iHhWwCPGUObTfCW
         r5Q6cglKfIQ72iTFTlc2BVA+AvqPUg8k6lriJTrNxpAtslDQCZyqDSeJP+RrX7xdtSOH
         Ro1oQGndRZX/yrNrJADmrglm2vvjyifldVsYCICkoJ/fRnqg+dKSCIOMoV1U/vPS52rE
         ODrZKcHsTd/Abj05vJn0ZUe7/gzwMRti3hWdSv92WFYeeto84MhcytkbZd43dFEmUGwT
         8ZzcD+bgu2Oa9g4aVYOdt42b/2W5rj/lzHglevYdrsrhCKQU1HUQXrEwIpzObVmrtzQw
         izhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742583677; x=1743188477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nR4lHmAwKxP9HyGmUTHKde+Eo7V+LJcGUFHENv86AZM=;
        b=mQEe6YQn31aw9D3XG8AUyhcYc1H49S8x8DwqJWdO84j+nz+3g8dt/KjX530GqVi8Le
         +Y/Js3dXFXhObIqzhWKjgxNWfTu6pNoITcOOzO1Y90s83DPxxir7+ILbRZtFxQDbHWV2
         2FX0KGdutNtb0x18bVD6rZE6tFKU/lV92/jvkSNL+Kjf6xfQ0WTstGdaoNTfCHO/FFgU
         PdSDucmFcT9ra5iaBbUb0k4R4rwl0UHHPVpJyYcpAoDVi+kYfq7RlrmRFc5DssfYCyQY
         qVOMCklR3R43KiYGe26D6p1HBMT7C1mEMhhCOWIAQQPVaJ0JJHtMlDRRO0AMcd8kkKyn
         8uSg==
X-Forwarded-Encrypted: i=1; AJvYcCWvqMqkyRTDx1k+p+igsOHzx4nxiptGKcNR3XscSRsWSlc0IbZ85i4DlTx4v9bmphR/p/BBYMn+0/QGuV5k4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3e1jBvwhogVT1o58T4dENNWW6zn21QSsMvZd4IeooA/Rt3ht8
	0Khm22Hyx05i2eFcqvIWKg6ubrL4K3m9Zvn6kyV8K6Lp11e9ntE5oT+OVOv4MII=
X-Gm-Gg: ASbGnctHKISbxyIgeaEaroiDnePRBW9QhdwB3wCfSnQQrbNIIWeQQZ3Ue5+zP465OPA
	OdzOyh1gZFNCMpT9su8w+twuvR+K4IaSXjKEGuTnTJW1f5CrijU8a56x5eerB8TV0mzl2gfysdQ
	4Qq7HhJADa34rqXw5ffA+4eXOKHmQh6MXJP+NFCKXStlDZ8sdVKTM7LuM4/ie1i463wSz/NMsjA
	adot1WJL9Zr4Nk4JU6zqrlp9e79q9gG27IUeWYS1LuOD993sDndd8dUHQbrJ93rhixavgMMopUM
	qns6m8qP6lP7dNnJG/ossuvaBdqZeEmktc4AHvLYqVv65YmsLxL/qA2hkcjNAl9PNzzqdv1KZ1A
	ljXTx+EMg75HUAlP9xRNCieakFoUr5Q==
X-Google-Smtp-Source: AGHT+IFCFymzOe+88jvBtqQf3WoNAsE5w0tNrMWd418HpWND6k2Tz7c1vpjL/c8frjfQ1C9HkTGr4Q==
X-Received: by 2002:a05:690c:3391:b0:6ef:7dde:bdef with SMTP id 00721157ae682-700bacd6b69mr56614167b3.23.1742583677457;
        Fri, 21 Mar 2025 12:01:17 -0700 (PDT)
Received: from Machine.lan (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-700ba73b9adsm4773737b3.20.2025.03.21.12.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 12:01:17 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	brendan.higgins@linux.dev,
	contact@antoniohickey.com,
	contact@byte-forge.io,
	dakr@kernel.org,
	davidgow@google.com,
	gary@garyguo.net,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ojeda@kernel.org,
	rmoar@google.com,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v4 08/16] rust: kunit: refactor to use `&raw [const|mut]`
Date: Fri, 21 Mar 2025 15:01:03 -0400
Message-ID: <20250321190103.1778248-1-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <CANiq72=jXTpoPAHhFC=T2SCyz3195=pG5h+-yohCCxdds-2hHg@mail.gmail.com>
References: <CANiq72=jXTpoPAHhFC=T2SCyz3195=pG5h+-yohCCxdds-2hHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Mar 21, 2025 at 10:06:03AM -0700, Boqun Feng wrote:
> On Fri, Mar 21, 2025 at 10:28:06AM +0800, David Gow wrote:
> [...]
> > > Anyway, KUnit `#[test]`s are in -- I was not planning to merge this
> > > now anyway, it should be reviewed a bit more.
> > 
> 
> I agree this whole series should wait a bit, but do we want to merge
> patch #1 as early as possible (maybe right after v6.15-rc1), so that new
> code can switch to &raw since that's the direction anyway?

This would make the most sense to me, it would keep things clippy clean
while also allowing new patches to use the feature. This would also
potentially help reduce the amount of refactoring my patch series will 
have to do as it's delayed. 

Thanks,
Antonio

> 
> Regards,
> Boqun
> 
> > Excellent! I'll make sure to review the new version of the patch when
> > it's rebased.
> > 
> > Cheers,
> > -- David
> 
>
