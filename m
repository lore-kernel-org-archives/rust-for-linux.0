Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2307F50F
	for <rust-for-linux@vger.kernel.org>; Tue, 27 May 2025 00:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748307240; cv=none; b=EnUTDMidpW2CYRhy8Q1urYtbVt1akbJGgqqJbX44dDj8I4J2UyKjhkFaCokdei+Y1AYB9whnCmcf+H+1NaWYvf9RYBjGvq/irnvFzxGy3654GfL0SJxwscOfYxe+NmLYE5X9h73REByZc0fnG1kdZLOF+PWlywKrenLPm0DxMH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748307240; c=relaxed/simple;
	bh=qp3+51c9g0O3GMBF2EUCRxNpFbCr9Lx959dJaFH0/qI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWXd4/H6S3qsfWcEf8y7JqZDcVqdJP2IxuJEaO2Mh9XoZmGnQiIu7njwCEA6hyNLXd2YH821gbMjS3vHDFvui7OQlkZQTybM2xfJoFKBqWpTtScrEoeIRFR8cZF3z91VDRRjfO0i7AhSE1VgKN/lvw+Z7th+pVYjNrp0unLCt2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DOszBAig; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOszBAig"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f8aa9e6ffdso24876236d6.3
        for <rust-for-linux@vger.kernel.org>; Mon, 26 May 2025 17:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748307238; x=1748912038; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kA7dw13ToFrAIbyI+Yaiyo+cnl/zYNapde4+aK9yiWQ=;
        b=DOszBAigICDrYi8JmXYdDR/bbNR7ldLLJXRdQDqDszZY9V+ZKDT9hMY7S+jCUiqKSl
         47my9zipCfKgh10XWNGVBPkJfXeDrQ0ZW+PlV0N1/JLAffICdCjj12bS6UofDrkBkKob
         bcudBG+sosEu+b8EM3gB14Zs8RvyWDYMhFBuSjOLuWyC9vBi4NWnyYKVBdqa5md8WfjE
         nUQaEABHDOOit26y0DmfrK1u3Ua+W3uO6ds8qtLzGED8LpqFYvOv1DuInb6j95H8HGr8
         MW5ULi2hWsmygNNn6JpenBtoj1bQXDbmvUhVSRP8N0yn1xeYqmPF4aGEaBvzfijYwdN5
         WwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748307238; x=1748912038;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kA7dw13ToFrAIbyI+Yaiyo+cnl/zYNapde4+aK9yiWQ=;
        b=FgQI5rbTgvyZE1cPvvF1J+evslHy2X96nyMgfGEv0Xlqc2SoHkLRyY+QiBk+E8HOW8
         /fDyHLQ+FGSx0MWN21bhj2Sy8Y0607L8zuWR1IYWMd9qsAepqVWneERQytdZnwcXYIe7
         W/Brz+e9eSYjRJwXhj1Ou7v1M4EoVlnn0yYy1+ISPd7OsiFNESO2UuNli5Dalssqnlxo
         qu0J6p4NLIUYY7ys/xBURG5FNeRZ/k9Oj1sed0xWjX7anT/Ag206i2wAZahobkOa/Qrh
         WQdh03bj3oHlG7NWQsfyfJn+XcJImcwjLJi7UzkAxMzhhkhMl49qJd9MGmIjGWEfkgpF
         c5Kw==
X-Gm-Message-State: AOJu0YwltvvCPRpLaZOqtFAbNHBAHjdMDl+pp3HQFTLHp0xYHkakZXsU
	4AIk+GxtGZx3T4ZMXgRvoiAGAAMOJirJh3S6K53XTdTAI0W01TVsv7B5lu3UgYYl
X-Gm-Gg: ASbGncttRNeH/S80hlvu1FP0mkO1OKq3epcYCSIRu/vDWssmUG1Ggul4H4p4llsh2tb
	QF/QSk0fw9cZoICEO/KBV79Ufzbla8XYIKiq/hTJOQzaVJByDHs89mpHlNaQerRj+phNKBFWuuk
	/0ik7MishoxpPOsZGDyRuwvMgVB7rL0PJD/s7Wx4tzqwfCzva1Ht57iLatCZkVJxHkSwMCJKrNW
	BCQb77LN9qoqHPnNfXz+qFW3al46kfMBEF0Rk5u/Xeo7WP67fJnblh3XE+7IAAgy2gw+AT9ia2k
	vt2w/ObiY6MA8IsfEW+niV1e15Kz5Cr3Mq7QYmYoeNWj
X-Google-Smtp-Source: AGHT+IH1zbhnyy3GB1CTiX0+GCtXtvfAihvUbVoKfbIcSfH5VYwrpnkZq8tPgEwTDt6XLp3BW7JmFw==
X-Received: by 2002:a05:6214:1646:b0:6fa:9e00:d458 with SMTP id 6a1803df08f44-6fa9e00e41cmr138683156d6.45.1748307237698;
        Mon, 26 May 2025 17:53:57 -0700 (PDT)
Received: from arch-box ([2607:fea8:54de:2200::dd7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6faa18a8a23sm36677946d6.114.2025.05.26.17.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 17:53:57 -0700 (PDT)
Date: Mon, 26 May 2025 20:53:55 -0400
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [[PATCH]] rust/list: replace unwrap() with ? in doctest examples
Message-ID: <aDUNI6eaifgJx2B_@arch-box>
References: <20250525225925.14797-1-albinbabuvarghese20@gmail.com>
 <DA5Y0QPY52WJ.DFA7YNSN2B2M@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DA5Y0QPY52WJ.DFA7YNSN2B2M@kernel.org>

Thank you, Benno and Miguel, for taking the time to review this patch.

> The subject of your email starts with `[[PATCH]]`, normally we use
> `[PATCH]` instead. Did you use `git send-email` and `git format-patch`?

I apologize for the inconsistency in the subject line. I did use both git
send-email and git format-patch when submitting. I believe the double brackets
were caused by a subject prefix I’d added in my email setup and only noticed
afterward. It’s working as intended now.
 
> Commit messages should be wrapped to a sensible column length such as 72
> characters.

> Also this is missing the motivation that newcomers might get the
> impression that calling `unwrap` is OK.
> 
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> >
> 
> No need for blank lines in the taglist.

I’ll rewrite the commit message to wrap at 72 characters and remove the extra
blank tag lines.

-------
Thanks again,
Albin
