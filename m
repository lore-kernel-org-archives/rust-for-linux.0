Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D1F2A1CF
	for <rust-for-linux@vger.kernel.org>; Fri, 29 May 2026 01:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780016722; cv=none; b=dQbdD5hkVIG9V1Ovj7AD2hFe5tKRaUZa1vEmjLPvm+Wdp883zbXYOoOQCLb0RHX2/l11xswklGBxrzUw9vk5U1tfrfFFlJQ/MK9GSqHbJL9O6TBIhQCJYo7MoUYpya0JkEfKFde3kz0I1m9jhupTFEE7GUZL/A6Q8Z2CSccS5GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780016722; c=relaxed/simple;
	bh=1bEqHSCCKRDDQQinQnzVucKwHK7P1jobeJy5PtN3mEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y0wxNWwgx+i2+ptsjlWtjJxVXZ2JLYkv+WbmvB8pUrUM9HZ7uluFDn3YTyDqJpRQOHHENbY6NoKQvV+SKNC7Aolmv1ucnXWueu5W4bHiUj/F6fhG1xkCxQWimIBDJJkKDVE1HgzKlTQRMR2OQ5xZGhY2LhQvDofu/Q40TRzc9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tZJK7yrN; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tZJK7yrN"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba180a022dso665ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 28 May 2026 18:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780016720; x=1780621520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+QSaewdY+ty5a2m2tiFLNtjVpl4qPVblZ3Qd1C7Nzpw=;
        b=tZJK7yrND4pk7cs3Ic3OUtbN418ArFwaX+zqoQU5wl6KO/KXNAiSsNyG5EOu3gmbmg
         HcR+asW1VJxcng79GRnCnnztNYojQcABaM5Fg099rrYHpk4pBri+MyL24GuOvaHQGhIi
         kvwY50qFjRBqXj7ivbpF7nXNNNsHQHj4cK2GBHIpCb/vzhcPViV+14wXDNAW8l0x6KK6
         PqPgDK+ttDR581p6RKUMi7marzCiI/2Q3ijvWNvHDXvVLWpiJqtGK8XeDfPGtwExDTxD
         jwCJ/XoLlHGrQRUkPJ8RCNKx1cqQ1kD+rHdUGb2M2pCiJuxKCY1WpbFcV/72Xv5XWyts
         Jl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780016720; x=1780621520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+QSaewdY+ty5a2m2tiFLNtjVpl4qPVblZ3Qd1C7Nzpw=;
        b=CkqtF/yQ5ygaYei5X2HdV97TPlG1RsTw/TrdPSPI9woA0cjNU3sYvx7+PqjwfZFzgx
         ZoMtvAPu9OurAYEofkiZPMx7cN74BqF3hDoxeBCOn47z3bavQ0qMIQvO3Vp3/O3eTQ8C
         LccSLed8vVKNiF6wINvb+ge+1FM+ACxLwz8ENuWDsIYEMUaToQjoEPSf1jCX0ScMy2il
         9ckXofOYx8lLv4osLAtSKlVMyos1kwoNaE4xn5dTYwVxZHGh35P3JS2NC5aWMzgnze8x
         LWPIg8x5ip1UxZoUHQKg8E6W7S6JiIrO7FJk7TRWwsfYr+5LHjz3uWieoO/kgZimAQ8N
         mL+Q==
X-Forwarded-Encrypted: i=1; AFNElJ95kTAVO3qj+S5amrEi7qyV2lRd5BGNMhOWP2X88U4k7bhs4kFNo5l8xN59e7LbcvE5NYBGEJx/BxJu/jGxfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1qJK33ZtK4xUw9ImWB8WC74/TyQFR5fGLjJflV24id1gyfoMh
	y9czeVyQsDcpoDQ2l81eU6vLIZxvfVHiJ1V4ScIyK3WpkJqSVsvacTTszgPB0BaIlRf6W+KQEbS
	wcOmxyv5E
X-Gm-Gg: Acq92OHHplZ7WWN1RUabnMNeMHG2W4kjZmA74Oa0sTahOyI5CsDZYvk5KtAnM1/pgeh
	wIjQysT5qvvDrq9iOJXkKFzpxJIBEXnXaefD1qbJ9H1fGTlR8ALPQ3kd2a3C+VbtL1tIoa1jPCk
	O/aVT25P6wC14yXRi5Xd0vP9ezJ1/hVYmF8dDOO+8YfIVoiauf30raG0uV3wKoh+XgS/TAiQd6l
	sjTMEU5L/1z6Wzyg9t01fe3kRJIQ5TR3xiBdjF9P6jJP0lef5XyJTp2sMAIqAiXuGqYcNBQLc8v
	/CPyIiiWfr6R/3lLFcMiTI7H7z81+TgiYDEEu9Tbh3kMsqv6QWNWV8QJCyvR+oJLv+3SAre1iSF
	wqu/eUbKsHdCZxa2ppdhHiE6VtAm6zr8LHi0QS7vEP4GM3mIhsFzfZwyTy+i2iYXddO1+JKFvZx
	8shlajFfMTd0MrFM2HTPEiMKm2owb61XlFZyyrC8Xh/GMH0udBRqFLr0fzK8DcYuHuK6EXqYaSw
	AqW9g==
X-Received: by 2002:a17:903:ad0:b0:2b4:60e6:44bc with SMTP id d9443c01a7336-2bf22eb5525mr266985ad.13.1780016719847;
        Thu, 28 May 2026 18:05:19 -0700 (PDT)
Received: from google.com (171.46.125.34.bc.googleusercontent.com. [34.125.46.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e5d83sm318045ad.8.2026.05.28.18.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 18:05:19 -0700 (PDT)
Date: Fri, 29 May 2026 01:05:14 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Kenny Glowner <sisyphuscode0311@gmail.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: module_param: add missing newline to pr_warn
Message-ID: <20260529010514.GA2807207@google.com>
References: <20260521161405.64042-1-SisyphusCode0311@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521161405.64042-1-SisyphusCode0311@gmail.com>

On Thu, May 21, 2026 at 11:14:05AM -0500, Kenny Glowner wrote:
> Add a trailing newline ('\n') to the pr_warn! call in set_param to
> ensure the kernel ring buffer flushes the message correctly and
> prevents log line smearing.
> 

Applied to modules-next, thanks!

[1/1] rust: module_param: add missing newline to pr_warn_once
      commit: ae12a56ba16adcb8a06d5b3b91d4f82a092e8de3

Best regards,

	Sami
