Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4753A5E87
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 10:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621063; cv=none; b=K/83wfe8hHw2nDwruaISqvOj7nB0tTLICI/91tzKHWJD3Zh3PSGeZ0NesUBbM7IAW8f8SlyLAntZgHPWArNPbBJm0hTIKYJH8mvLPw5C2LXirgBlYKT1Mlbq3uEAKnIN7IeC2nRKuZEFEEEUTwEsK8iPvHsKFt6TQID7H7Q6CSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621063; c=relaxed/simple;
	bh=7xHYTN8vEq3eQBZDedfY7A54wczhUz+xR6ttxUFtPyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DR9Ofmx/wkbbJa6RyqkAIu/wfKYF7+uBNtNMLmilb4w+R7EO9BtzSaTAYPBQc6zdHfY0a+emuZ/B3fjXo9sNNwPN9+FV94NeFNpyXysXghhd6W6D/Uvj6Ph8sorura6tk8nIGIgVP9LDRMhsfTo6o5nBUhn+thcYs/jwIAlv8sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PE3rf2jA; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PE3rf2jA"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b904e1cd038so890370766b.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Mar 2026 02:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772621059; x=1773225859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7xHYTN8vEq3eQBZDedfY7A54wczhUz+xR6ttxUFtPyk=;
        b=PE3rf2jA+hI/dYht8j/cUAUe7BLdbzMkmDWWXGVkl4PBdHBYIE/OJXekfzgfhB9jzT
         RIhUijwpUGoe0ydRKAxweOvx0FzTBBw1vRryC2UtTvVyAjvO+EagkTAKXYrKSkmVlDfF
         8/XzG1ikxao32L6kbBWLyi6XLfvzxu+kPpsLhPujuSFrdInPjfB7Q7AC7E9h4CZfoEmi
         4K+ohQvijZnYnI2jX7VUpMIBBZbGexQKwD6rIKMNX9T8SjeaZ7ZfYf/0eJAbwlZUiD+Z
         pLeSW1bCayNvDSb9QZJINvFkddfDbMALSpZXvjgtXauCx2mAWk+eapjstbs8DU2NsdDP
         pc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621059; x=1773225859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7xHYTN8vEq3eQBZDedfY7A54wczhUz+xR6ttxUFtPyk=;
        b=YZ8YQ87Os/kf9I6pyG85+0yqehW+IrC6FvJFNoOs7mgCoVdrlkBCQ9RDtD6nECtFJa
         KwQQ3U5RVdjOCsLvqSWK2+Q891iAQ6hnIIM7SLMw29hZe32UmLqUKZ2GbpFYaarVzdlw
         QbCGXLJPIbVcaYpYBV+3Z+NvS0j+QyMsQgM7z2uy1CA6yPkP2o1T+6j6mBAjvV4V3mPI
         u+UsCnup7Dx14Ns0nN3Vi6vgNuWYo44S2bq9HmR8b4Cb5Q13vEltqC00AF1qmgsp67Bs
         WenTkJZmgL4RAjY1O2NqygOAjlrp+DMtZ89YWPqwpOke2+aK2Xm4ru8p8UBvi56liH+L
         3fBg==
X-Forwarded-Encrypted: i=1; AJvYcCVAG6jGKlA9p9qz7h15m6uXhEjGmXdqbiDooCgRalEUf1a8DWlV5tPPqE77wr1rJyUxRsMy6LGo0Duh9291dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSSdqQmbrW9p2aaD4fw/ZiWOBYGakr4Ic8+krBiz+eLdEPh1mB
	hpa+ZI+Rg+o6Ts5sxQuU/fbHDFMfAM7c1HxQ/4Wk1qzhujC7EKXI3PEJ
X-Gm-Gg: ATEYQzy1mp2PZ2czzoNw9Z0MSvKSUmqzf3561Ko4fGJBqKwdH1VaS0ONaYo0nX5d/Ka
	Tm3uwYT7oo+Ga8gu+k0GcT7xWiv5o66PkiS1g/ybDpy+lGESw3vx/QGkTQPE9IgIPLBywddFE0c
	TWAHVrloNBbi0y7zoXm6o0sU20M0XNAN5220ZMRQVJXIKPqQPM2rvxbq9s7q7Y+KYIiAW/3duwy
	FcsuwYtkmLSKJkRDbputQlOR25YBNeNlFN/amYMEXCyOhZiH/l43KLMJzMqrelBEKra8OC+6AkE
	+vrsj8611FFKjGatdqfVRXe1OL7qiDaSrixxA4z2BWFmSaLJ7gRveX+eqDwbDn/aIZPRNOo8zZM
	iB18c52Xd2kSPsd+2EpzIMq+10B3Sorc6+t/QVqbDzbdLl87VsIKuU4XX+HTwsgeS+BwbBfM5/Z
	cn1YofnAUGlPU66555kHUEc6NGTC4dbw0BjGZ/3nv9AnBkmBnLFpfPh4u7GA==
X-Received: by 2002:a17:907:930d:b0:b8f:a0e6:b261 with SMTP id a640c23a62f3a-b93f13db7c7mr73070366b.39.1772621059193;
        Wed, 04 Mar 2026 02:44:19 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb ([2a00:20:635b:6c1d:750c:5b7b:26c6:b5b9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aead96bsm725884966b.51.2026.03.04.02.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:44:18 -0800 (PST)
Date: Wed, 4 Mar 2026 11:44:16 +0100
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org, 
	acme@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org, 
	dakr@kernel.org, gary@garyguo.net, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, lossin@kernel.org, namhyung@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v1] perf test type profiling: Remote typedef on struct
Message-ID: <gfdliffsgy4j6q2vrilr6kapy3hczh4udszy4wcba6aal3ado4@hfeqa2eizu5y>
References: <jiwt5mjma2puv7kjbgploxx2l5tankjm4zu2tsa75qkckwnwjk@f7mz5vlvzpjz>
 <20260302235821.588686-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302235821.588686-1-irogers@google.com>

> On Mon, Mar 02, 2026 at 03:58:21PM -0800, Ian Rogers wrote:
> The typedef creates an issue where the struct or the typedef may
> appear in the output and cause the "perf data type profiling tests" to
> fail. Let's remove the typedef to keep the test passing.

Yes, makes sense to me, thanks. As mentioned in the previous message, it
sounds fishy to me that perf record and perf mem record capture
different data type -- I'll try to get to the bottom of it (I was sort
of hoping to finish the cross compilation topic first, but since it's
not moving that fast, why not do some debugging here).

Reviewed-by: Dmitrii Dolgov <9erthalion6@gmail.com>
