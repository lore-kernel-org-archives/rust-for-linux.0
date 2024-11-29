Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8543F13DB9F
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 20:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732910656; cv=none; b=clQ5deGTE7CevGxllADNWWiX1D+xaPgJvN9pYQ8AUCSO2EN9D8wCbx/laLZ6T5yaO08c5KVw43cn1nrIXYVlDzYhNGAwbke7ct6K2dsJMdzEXlTGb94Y013FtZJXp6NsLiIGC0mML/ub3gbVSg0tSSKAI6skhloet5062zxaOyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732910656; c=relaxed/simple;
	bh=YiQQdrsvZ8u+vT+N22MshcrR+ZiBD082KKR1pcVh4bE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNV0wuASy6sqXLGohgxNOGoRVCS1lh6qv1I91NtClwUeClZ1qswmvHikUyG2Py7XRGcTSdE3XUcMlxPQ/iWzXs+xjh2nFAGgIjs2EmOARpcB3TDiQkx3EoM1NWWxH90FK0leTs5Hon0kUlGoofeIhskUEW6nqBWG4MagLD5DMTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eVc2DvO/; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eVc2DvO/"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9e44654ae3so259724066b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 12:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732910652; x=1733515452; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lcmuu2jINkD9ZCRt5AtefT90arhaSrjY047NfXERnfU=;
        b=eVc2DvO/uOsbp2cKrXA80lWMxslteiEqffBIb0XHsnXxNdrMJj4tA4V/mJgWKdHlkm
         QL3LNB0IYpXL2YGkFX36E1FR5T+Jo+wKr+eKboeqW5yYgDjTg8YHXsNPt5TFbHDQAAz/
         zcY37WVUG6Kk7VTOIX4L1g/0I0Wczfz3VpYAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732910652; x=1733515452;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcmuu2jINkD9ZCRt5AtefT90arhaSrjY047NfXERnfU=;
        b=M42FLy7SoyLAVsX9IO6II157CFiS28k1VZrKeUt8YUvOcAWpciZzK/+jFYWWwwmJeD
         k1xmB7U+DeYmCaSY9n7xsGtbaKcvuPeArDALpGnXMwGUGWASJgEERCsfi4jN/WdJBvCD
         fSgGR2y3AogstDO6lVj6GXZv226DOqb/Ztl1wbFNApZVowUsM4o6fbn67Cq119/1OHm5
         fG2kyDBFcyfx8xmF0wui7dV2prnWqZ/K8gfOXCWmjTw7E6AOBx+ViNA53h7aIvrx9527
         jCqIFDwKajpBKsru0mQy7Q7jt6XlwGr8/X/pdg1prvSuw6fP8w9e1Lwi6+kDpHnGEl3J
         2RiA==
X-Gm-Message-State: AOJu0YzTT+WqtZKDnMzBxTef/bn9z4tCYaSfIYHLfMnUJMJZGiOe/vbk
	YFV2XkTlPDgrra6nNNxc4WMnr4lEFuWhGukeSDRkcqgpsefl+ia4F9e+1LCAwKxE97TdSVN9l+q
	Gm9j+Qg==
X-Gm-Gg: ASbGncuhLaOdvlBTvhgEmzYrHl5KjVe4MCFAksM1P4VnexmxXbSESUeOdQ3bSihVgUN
	4Q2ts3fJUpK1xSVR3LWPagnbCiTcxNtNQ5e/MydokLsVCtcS5n8jQgsl0q2+0SRFcW7y9JC4lWl
	ZrjrcOgFbNtOsltN/ys+9No3v4p4ZkcDPRI+MXRuJxBEVN0D4VEJkUzcQxwtqeUeAvWttqkOwMN
	xkdNh1gY/MeKKPRBrLta7gfJ4dcEIyXGg7yzp1c8ej97iYF8d3r9/M6TfkQOCXH2G7gjMK/TYyZ
	m9U3zZVb24PLd+RMX3iLfP2E
X-Google-Smtp-Source: AGHT+IEu1zwtIKq6XvHVDOAh25yuZgn95hP19WrlpYFDhYKdtWt0u3mRwc44EWXUZwWIKRjaqyuw5A==
X-Received: by 2002:a17:906:18b2:b0:aa5:241a:dc77 with SMTP id a640c23a62f3a-aa581073ea2mr913088366b.54.1732910651783;
        Fri, 29 Nov 2024 12:04:11 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c13fdsm208727766b.26.2024.11.29.12.04.10
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 12:04:10 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5cfddc94c83so2612584a12.3
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 12:04:10 -0800 (PST)
X-Received: by 2002:a17:906:2189:b0:a9a:3705:9ad9 with SMTP id
 a640c23a62f3a-aa5810719d7mr905194566b.50.1732910650277; Fri, 29 Nov 2024
 12:04:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Z0lG-CIjqvSvKWK4@kroah.com>
In-Reply-To: <Z0lG-CIjqvSvKWK4@kroah.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 29 Nov 2024 12:03:53 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjRj_PdQ63rnO0ikN9b1wqTCC2JHdVdmtDQgayeXe_==Q@mail.gmail.com>
Message-ID: <CAHk-=wjRj_PdQ63rnO0ikN9b1wqTCC2JHdVdmtDQgayeXe_==Q@mail.gmail.com>
Subject: Re: [GIT PULL] Char/Misc/IIO driver changes for 6.13-rc1
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rust-for-linux@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Nov 2024 at 20:45, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> Note, there is a semi-hairy rust merge conflict when pulling this.

LOL. That was literally just one side changing "core::ffi" to
"kernel:ffi" next to some other unrelated changes. Not a big deal,
even for a rust-newbie like me.

           Linus
