Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B3322ACE3
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Jun 2025 02:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749436621; cv=none; b=tt+Qfi+Nf3M97/GZjGh9AuqcEociBUg5KwxKnLOiNKo7VtWWrrhtsrZpNJUdci+vFfN8CpYGjW69Vk+COH0DY+iEO+OJKn01k9x6wZrQ5SB5F6t9oi8PQA7ut4n0JrwclgTetjo31eJxG3dKfRxng0a0LcsQ+8TaQeNIu7buDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749436621; c=relaxed/simple;
	bh=R0h5h1bEyC5dQGpMZ5Unuo2nd8qE7BzdDg7UDtUnXbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t2jwTeFCHoSBnTUpBjwbU+t14lsQ+ALeJVz5A9uXa6Ww4sTUJcq3Zv0gj3xlAbE8iB3TZWf+YaMKZdNALHzO+GFWuZfxb8o7fpSQ9dTrDRy6uGVPj05g4Qd62fZiZF0igZY1xLY4nYYgaGuQW6y60kQnRYU0g+9QCyQOPS4oTPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JkFKDKAf; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JkFKDKAf"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-23508d30142so50924075ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 08 Jun 2025 19:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749436619; x=1750041419; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KGBdjbD+r7EhriDTReRo/vjOU6dpa3NoNVdQ1TG/O+k=;
        b=JkFKDKAfcvsYH97B5t60GWa5kkKSbLe5ugQwFfR4eYHLAPTpo7WVKCUR8+MWtZ308U
         Aryf8NgfoRlNojduD+Iwuiwd1DA2U2O8u2oskJZbhMoUVIlMSHoVbHYvmJ0bThwdWnww
         jdsITV75bW7KY/Sky8mIU7/aMw5WUyqqQ0BnUp1ztFjkK9ffkGzYE6Dda4RqEIxigPYT
         ziEVMqIIJrRTWvBvvgHP5qa10BANa0PqtCqSRlHUEdAiAL95VJ6xPQhjUP+YrZvim0Wn
         LBipMm8BMPvDNXBRnRp70x+G4z3l94inteC5fJ9lOczkurC4vEN/UJBhqXni5lEKf+y1
         m7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749436619; x=1750041419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KGBdjbD+r7EhriDTReRo/vjOU6dpa3NoNVdQ1TG/O+k=;
        b=fvgyG9bWTUPXiz2MAUYjSh8kn5Smi/lj6N7wtig5SI3+Lb/ns4qfpWKNLlNnJ7gA04
         iaUZKZRd8US2D0uwi11uV3Kg28aKBpplPFQ9xmPmJteVhzYg1rZ5EDhT2CVEgThTUQAe
         IQiAmjPo0cqu1D1dJ2wr/Cig3dkYR2YKj5mYAwOatrwi8bT9SuR38IdxF+nDBBtV1CTD
         g4T0dNTGWKqEWcoESXwQ5XXADLZqLaE6D0yegHgoq6XYb3dFtQv/nHk9Y8yM7u1Gbg4j
         DUHNslgO1Hgn2kkW7bqxp9dJiMnXHjGv+YtrrColSixkI6JUHKoFUu1QrKx0hS0SY8XM
         KuLw==
X-Forwarded-Encrypted: i=1; AJvYcCUGf4lQXkCOZMjvMk66TLXG8Qo/OeMMBlsSvF2TAXvi/88y6R8TsbATQCfkweuguLHTcW1zr4lpidm9Z16TDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz6Qcsykhz5BB+VEVUGEI+UjQODe8Ugct6P1rdEszktl1By+Rl
	7C3dZfGQbxlzVq3XzJsDFpUxycBof1FmeiAjEY4r0lo6dixLJ/L3Yp/Ipp1RXs+S+xw=
X-Gm-Gg: ASbGncvVv9avyzNkMnQ30DhG6sMSs2SsE+C1n9+4hJvwscijx4x9eyRqoUOPBRRiLWM
	7tTJS8NIbvqzwp9UhIDomqee8fhUBIWtOMSPI1/7BL90oQXxPfv9XYlPddi4bmTigldgOtFhmXu
	ppAxUnS/f+V0EB2/Nk476t4WPhSgGCAoLk1AcS/ReV/nL73WObPFogxSRI20UVtg0MySiNSF3tG
	ZgK5IMns35bVUGvZwNlNj79qcK8atezjocfRyj7E+v2mQd8pdJEh7heiA2G03S2yjcbs4Ta+KQB
	mtjgN7VgSeOUBxRL1lvZb1WZWpkwsfDlHGpXK1j4xMYCrvMVF6+9
X-Google-Smtp-Source: AGHT+IHq1EECm8UAEXoryyssCckiuT1lwiE3kyJ+2cywlbEqvKx4+f1qsF2+KmgK+wPvK5sev7n0AQ==
X-Received: by 2002:a17:902:c952:b0:234:f580:9ed with SMTP id d9443c01a7336-23601cfa542mr151014935ad.21.1749436619359;
        Sun, 08 Jun 2025 19:36:59 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603078941sm45015165ad.7.2025.06.08.19.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 19:36:58 -0700 (PDT)
Date: Mon, 9 Jun 2025 08:06:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: cpumask: Validate CPU number in set() and clear()
Message-ID: <20250609023656.efvgl7efmfxhloxv@vireshk-i7>
References: <8b5fc7889a7aacbd9f1f7412c99f02c736bde190.1749183428.git.viresh.kumar@linaro.org>
 <CANiq72nxs4BTFQQcJLgrbgHDzQLbhAA3=qsycdKu=oxc2V=yqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nxs4BTFQQcJLgrbgHDzQLbhAA3=qsycdKu=oxc2V=yqw@mail.gmail.com>

On 06-06-25, 12:11, Miguel Ojeda wrote:
> On Fri, Jun 6, 2025 at 6:17 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Reported-by: Miguel Ojeda <ojeda@kernel.org>
> > Closes: https://lore.kernel.org/all/87qzzy3ric.fsf@kernel.org/
> 
> The URL is wrong, please point to the original report:
> 
>     https://lore.kernel.org/rust-for-linux/CANiq72k3ozKkLMinTLQwvkyg9K=BeRxs1oYZSKhJHY-veEyZdg@mail.gmail.com/

I am sure I went to your original email and tried to mention that here, looks
like I copied the same link here for both (facepalm).

> I would also suggest adding Inspired-by or Debugged-by or Suggested-by
> or similar for Boqun, since he figured out the root issue.

Sure.

-- 
viresh
