Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrwAKjrV"
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C2610B
	for <rust-for-linux@vger.kernel.org>; Thu,  7 Dec 2023 00:48:50 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d04c097e34so5394935ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 07 Dec 2023 00:48:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701938930; x=1702543730; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pCwp8NEpTkc0SIwpsSCFlzIYpeb6rI90EcFHpl3a4XE=;
        b=mrwAKjrVObus0EsFay4ssKyAbiJYdV2fDKMoMVBvdOG+fkbNrTdZLR5azlbn2thaSE
         64uo4+pIoTrpC5xAhwJOVBLnTnVMThgddZKTWaU/BF2In5wWSqQAUuhbWPBovkJZUep5
         E0zYc38ejHVoeruZYY4rn8GjUfKVxdsdPKPQ6HsmZFIAhcNLPAwJvwZHqPZ3Emppw1fh
         lG4Dk44y11jWQhC5TkEc6N9+S46GuWp09hWArAf3CsaSjDV7WVoHnqOno7MJa8pbXbQL
         uXeDjj1V6bB+YgvH72G1LaJXxXYS0ZSmVX+afzDlSYUqnX052cFCL50nLo9dPalRwW4t
         iQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701938930; x=1702543730;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pCwp8NEpTkc0SIwpsSCFlzIYpeb6rI90EcFHpl3a4XE=;
        b=X2cJn8iurU4mXtFHinlCBw+BZvKaelBeVc3cZepj/4qGnPaLm0oQuAU3NSSIEsCiWT
         514t2tppEPD5UdbGWN7z3YfT+loSTnTyU4Bg/k4RevLtQy7XcVKQdc+WLmn4ieNbquah
         cOJpO6n0FalX6MpzJCrBWkNB+A2aFys4FMAkV5v3gmLtfHgBe9XLAGeQPRXYyYHx2wwx
         ENbvT0ODrI7WDg9TB1A3g2/AfcTErJzmyuYBXeShbmABMWDQWROs7hilI7LGEIS2toI7
         L5yjR/Njq0nxW6l3sFPKh3/6VLKkpFVtiGZwd2V+8agTTzMYMJ/22GMdFIliRpeo+HKT
         /pkA==
X-Gm-Message-State: AOJu0Yyu3VqqgK4orLml9kao4Sl3u4GtGqUbkV284svWKwzTHzG1UxeY
	maSzV3OWHpkE5KXbfdNf4q4JNXsWw/JX3+a8QAA=
X-Google-Smtp-Source: AGHT+IEerQdHiCXaQcFcLyGna3p/VbQ5qevpA5wq293e3dgIBhRAQHbVQazhANQRP2Swy3fTHvuhvg==
X-Received: by 2002:a17:902:f542:b0:1d0:b32e:c808 with SMTP id h2-20020a170902f54200b001d0b32ec808mr2731323plf.26.1701938929820;
        Thu, 07 Dec 2023 00:48:49 -0800 (PST)
Received: from localhost ([122.172.82.6])
        by smtp.gmail.com with ESMTPSA id b12-20020a170902a9cc00b001cf5cb82358sm823178plr.14.2023.12.07.00.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 00:48:49 -0800 (PST)
Date: Thu, 7 Dec 2023 14:18:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: [BUG] Rustup override doesn't work with O=<build dir>
Message-ID: <20231207084846.faset66xzuoyvdlg@vireshk-i7>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Level: *

Hi Guys,

I have just started looking into the kernel's Rust side and found out a minor
issue with build.

I use a newer version of 'rustc' for my non-kernel work and have set `rustup
override` for the kernel's directory to use '1.73.0'.

But when I build the kernel with O=<build dir>, I get:
"Rust compiler 'rustc' is too new. This may or may not work."

Setting the override for the build directory too fixes it. Not sure how to fix
Makefile for this and so reporting here.

Thanks.

-- 
viresh
