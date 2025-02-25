Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED6F1E7C0A
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740484366; cv=none; b=Ddta8FYfhUFyPTap08lNzE1TbUX2V7FzjFcWaqTATrvoq4izJJDKVx7ULxksKgEizskYI1Or4m6dd7cU+bMiQani1CG8bNM+q0WtszR5iE8BsTLWeENv+mBaK4P4KCq7UvJD3tW8qNcqXtD1x35O2qQRfe4m9+3R+MzrORY34oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740484366; c=relaxed/simple;
	bh=iauTMNsGMEck+UBS5zMelSzVlcGUNR/zltR0cFu/GS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mSII7UNtF/Id6Y3zDmF6RG1pXsWVwwTniwBwfQ29lgLaezxLxoLKJpZEFBtVoOLEhq9Q5LCpcpumDJJCeyf3Nphcol6pSkdgfTIvuSSz7oxd0oR8X9fyREcvodBeBj+3PoaQtkqHn++FyiHoy22pGOD7K4ini/onad8X3ajTP/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuNZN2h6; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuNZN2h6"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc11834404so8495656a91.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Feb 2025 03:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740484364; x=1741089164; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UKkZk3XYe10sI4SqCfaUF2vUj6jiQSGLjxCT1Jj6tXs=;
        b=TuNZN2h6263tUqtvy+c8SZE/abdYlsEl4V9HK3+qeZirzxzwbSYjjqntQTD+kk0vs5
         eLiZn7FIZ2nDMaOcbIzKemuqnLXOoLcWmys1llhktTkGB5p6dlaC0BfyP2xNc6q7euAY
         PldzvRxto0RTfjIyfZ590+sp7YMw00zLIAh+EJ/P+AYUktLg8v+eLK19y3N0K326PoWA
         ypCfXJlf1vnWTcJKXbcuwIl+F2j+q1WiQ9tvpcGz8NW/CR4QNTFYEBczyEPoTqyvjv3+
         4Ocd98HT/7fWqqhlSV1jtAJUMeD51Ah/lo6oV7ZiluaxsnAf+o1NMU+/AYbwf2EBqWCk
         8wFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740484364; x=1741089164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKkZk3XYe10sI4SqCfaUF2vUj6jiQSGLjxCT1Jj6tXs=;
        b=lGGvyaRtnfDxA5rNY8JYmg3vnXOv9/DAWuAW/7bsygaOkMFy+my8QjOIToaX7B7nNv
         XJOTamq7jMmmYQ+RhMPF19TrnnLKh3pOXAsord2fNY5kB4Fu9WtS5705Pz0Q8zlMt48b
         zrpAzo0EE69c+aO83sJ3Va8dcvAoWDD+mkDBbyCDKF6lFsIZIlWJqPLWNnv5pAsWjVJQ
         s10FNtPaYglaGoF13q8ALgHDj6pnNSs8uyJdjYjNsm9m869LOhcepC1JfVu1JqqXI4ns
         m41PGEhkBXtd6i9yqzeE38AYybxQM5nivZ8b9dczJs7Fs21rzaaTHl9OvQ01IsxD0Ngm
         +Qpw==
X-Forwarded-Encrypted: i=1; AJvYcCWQkYZWqqsZUfYflzpugovcVeuRysiYPMstTiiCLfqo0X3z0I9yysJm0g+xbPlj1WIigOq3EakIcTHQuikzYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmRM5wLFo9TH+cSfUOlTN1Qzu0QPepw//Kd7kaW40K+77Cq47u
	Goh76anceAwXsjIjAu/68z40WjxcbER42dgmLNR4swgbtGNFFk+tPLOgoxuCBuE=
X-Gm-Gg: ASbGncusjCtibxQ1QxyU44++GDBlTadmI1SJuPKIOfSi9KMVEW3GWkAK9MtiCuonrV0
	O7/yk1m/cJgGnI9b5KKyuEIN++tlSWJMxdgenRr9JK7QouT4HT/AmFJMc9GzYWrcq4ZH6zpMP1O
	NjZkdPR7mWok1yUON1EDqH/VznGasFtu1k1jIbF9g3x5IZSQ1dCdu3g3O577fuybzm7FDKYk/fi
	Jhs6URHWQk8YCGmxlmPhRJsTkAJ0UoTIZPsCG+E7H1m8gKs9kg2ZvBrMescg88fxnB2rDdxZUnQ
	S3nBHuctOpt49wi3n80xUujtEBk=
X-Google-Smtp-Source: AGHT+IF5Kl4zanHSbJ5ugAs5izPcChWCGh6n67Lw/yDYylYVv6mlKOvTyZomHkrigKbNsZ2kNLDp1A==
X-Received: by 2002:a17:90b:3b81:b0:2ee:9d36:6821 with SMTP id 98e67ed59e1d1-2fce873b2d4mr26764094a91.27.1740484364195;
        Tue, 25 Feb 2025 03:52:44 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6a3dec52sm1346475a91.20.2025.02.25.03.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 03:52:43 -0800 (PST)
Date: Tue, 25 Feb 2025 17:22:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@redhat.com>, rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH 1/2] rust: Add initial cpumask abstractions
Message-ID: <20250225115241.cm5qdpa22gzi26fr@vireshk-i7>
References: <cover.1740475625.git.viresh.kumar@linaro.org>
 <68ac0f0ee3c0ebd3d3cc078a6270752778a1b732.1740475625.git.viresh.kumar@linaro.org>
 <CAH5fLgg7o7hs5B4mMzPd6RzYm+RcX8gw1Aw8voJqnmfnA_aM4Q@mail.gmail.com>
 <20250225105425.ooqvefiae5bmr723@vireshk-i7>
 <CAH5fLgjbW0yGm0TQcQEG9cc+i3WxbF8JKaqBUFD7=pJ-JkJ9zg@mail.gmail.com>
 <20250225113642.5fek3cy3jvmusunz@vireshk-i7>
 <CAH5fLggYMHxuoc1m385UL7sNB1ojAg=pwZ-_xfgHiFSV1-xpfw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLggYMHxuoc1m385UL7sNB1ojAg=pwZ-_xfgHiFSV1-xpfw@mail.gmail.com>

On 25-02-25, 12:39, Alice Ryhl wrote:
> On Tue, Feb 25, 2025 at 12:36 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > On 25-02-25, 12:34, Alice Ryhl wrote:
> > > Hmm, ok. I would have expected it to format on one line:
> > > unsafe { drop(KBox::from_raw(self.ptr)) };
> >
> > I did try this earlier and rustfmt suggested to format it the way I
> > have done it currently :)
> >
> > > That is what normally happens when the semi-colon is outside the
> > > block. Not sure why it did not happen in this case.
> 
> Very weird. I'd guess that the #[cfg] is at fault.

Dropping #[cfg] does make it complain with current code and suggests
to format on one line.

-- 
viresh
