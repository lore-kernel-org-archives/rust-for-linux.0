Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5542D221FDC
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 10:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800020; cv=none; b=NgxMHT35MY1YBBliq928GO9A43zqig2lWnRH+7Ff15ccqAN47Qy5EVfXpXdGVEh60oTv4AhNgHuRpt1dhL/gZwleThtm3BhFthI3/krDqTUzR86R4RUN6D9hCx5y0FAK5M/VkwTIXt58ku4jfG/MCtf6eyuDMFNRNSRFBhUfHT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800020; c=relaxed/simple;
	bh=AW7LAXhV4M8nrRRBsTVlNww4j59JMk/7529JME2B/rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YZe7rAENE6mgz94giu6Y6WDLDxmrZKQlbDioXn+APcNSyZlgBdSoYh5oGLf4XWO96XhFA16ei28mIuKmJ9oBIVbA+cMl80CMdUarBeqjwNowjR5lXARHd+UaPu0Wh+tc/8o+tmB/y3SlhGlAFHGHuWT1vvYkZg/l215KF+BKvpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JD+HC2/K; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JD+HC2/K"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7376e311086so8670963b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744800018; x=1745404818; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ttWNacvPGMYQA86vkqzo9EZOaHGhJM4Jor7D4v7bz+0=;
        b=JD+HC2/KLl5Kw1IwDPOQX1FlAefqYt5X4wCei0hd2eRydlFAvDFGe5D872rawwIKpb
         tp5hIEPbOxZdeMzAsYCu9B7HUXtxXErxMBAqaCtE6NpMOP+epDQIx6bTe8VSaQThnFvX
         YNgbTWwtKQ258NojH3FFi+DYLcIWIeEXFTReA9k89RMiOV7csOOHBkWMXGtY0slfGQ7f
         lLTOKdoPwDdrSTTXLhqagSTfbp0wr70b+A9Dk0vj+SlqbFNJX9rGdHKAKeEXg549PWp1
         Y2Vb4Ta8yi3b66F6coUD0kfIMJXDTOpBbnqaoRL50Lv1YM+3yMCPYV8oCmCh7KZQsRYZ
         hnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800018; x=1745404818;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttWNacvPGMYQA86vkqzo9EZOaHGhJM4Jor7D4v7bz+0=;
        b=Id0jTDGWT0ivDT4b9BLmo9R9UireANxqZCxGqARG+i6ILsV+bpXdyZZ4TFWfIky0fW
         VJ4V0dgh41JTKiGyHpN000EeiuMjDwANR0tnn1LcpDGXGWnNHNll+HzILHmYgfstp7qg
         8E9AtxAHTphttgwsdcsuLAHoD1/mwXhcH9dJoyJ2dmr6hem9UcJOAouZjfmZrKMC9UPF
         Uw6apn9saUNQVFVFhx8TdvYTwvSa7k9JNurpDvyFIGrBUsESMTaIb+Ys0z9I2Maz1Xy8
         K50HOGioRCk3YMdXgsrd7h9neSM+ogo7yXiKPKz5AtJ7R6tgzRdKPTbcg8mMRT35W2aw
         907w==
X-Forwarded-Encrypted: i=1; AJvYcCUWy9cL98P7nJY7efhObjQ/zBOCnPAam8vcOr6LmR5TkeALb2woqsbkcNCNB5y2CEi2MtY5MSJ5v1nP362Ujw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzR6q8fV/T47sFc4RgDe5HYraoZUHgzJe8iqhVduiPmB1ejRnjZ
	p0eoDueFTNdUYCGIPV7xZq3dVtfyI10GP4c2yFCsT82NmrKzi0gS05mN0B0T1YA=
X-Gm-Gg: ASbGncsrgMCSbtYnT3OpNB1OI4uFqOWN7j82GV4eRMr9Iy0FHY5VGARw4M2DerkXcfh
	OrLjvYMOoZmF8q2EXq6k/mP21hOGjrrQVjFj8BN5a3wKGyDz41nN+71mzYGB49DNeR9PlvrMgCe
	CdhC/9sc8UdNL6SptgcpkYgEdalQ5sH3WOQ29VZ0H1KvbTxkX4s4pl1pVVuMTGl38FL+hodRBcc
	aYnVWy5nwkYwEqbb35YBKiW1Ix+Uo1NK2F/OGv3pOk/ACw+T0pJJ/fQ1luajQ8PGTvbI4E+dHZc
	PxbHX4VaSNqMM1Rz6Ka24IQBRYkMie/eXFaWBfwHXw==
X-Google-Smtp-Source: AGHT+IGwBbJAub8B5aJaGw+Dq2HNzt5OaEsdk5WiMT3ZEcrD7+h/HrHX+IN/nBZbxfI2sbK6SePbFw==
X-Received: by 2002:a05:6a20:9c8a:b0:1f5:8eb1:d5d2 with SMTP id adf61e73a8af0-203b3e90173mr1985396637.13.1744800018636;
        Wed, 16 Apr 2025 03:40:18 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b2221e78csm808883a12.73.2025.04.16.03.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:40:18 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:10:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@redhat.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V10 14/15] rust: opp: Extend OPP abstractions with
 cpufreq support
Message-ID: <20250416104016.mkzyitdm4moz4qts@vireshk-i7>
References: <cover.1744783509.git.viresh.kumar@linaro.org>
 <a940d1b1a02d99fdc80ba8d0526c35a776854cb3.1744783509.git.viresh.kumar@linaro.org>
 <Z_9v24SghlIhT62r@pollux>
 <20250416095943.f3jxy55bamekscst@vireshk-i7>
 <CANiq72=MQmUop5UzeeN-r7gAE0ep8Z+EUaLuA6exeazhZCHqLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=MQmUop5UzeeN-r7gAE0ep8Z+EUaLuA6exeazhZCHqLw@mail.gmail.com>

On 16-04-25, 12:31, Miguel Ojeda wrote:
> On Wed, Apr 16, 2025 at 11:59 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > +// Frequency table implementation.
> 
> ///
> 
> > +        // Returns a reference to the underlying [`cpufreq::Table`].
> 
> Ditto.

Hmm, I did not use /// as the comments were added to private
definitions.

Sorry for the dumb question, but why should we use /// in such cases ?
They will never show up in documentation anyway, right ?

-- 
viresh
