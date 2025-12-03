Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1CE34EEE1
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764779504; cv=none; b=KkBXbJ4cYQe4l8b0yolMhxAYJBRm7U99aG4iNyrjUdGtUwVhOKTPbFPF/v4GA9M4J8pwoJMu4q36I63geimXcpj99MlNZPYdpMqDJCfZtJXVOs/r/NG15K8CAUrpfqLTPfobsAoQsyUHc85Ghja/evTkBkZ0VxhBKVyyILItlm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764779504; c=relaxed/simple;
	bh=l0gnY/UzSbFUAuDU1KntIMiLjASuWWo0nEVW8bui9Tk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=NEk+kEsgRQqfQOEBUgx7OHIWOVW/ZF6dJqrj8WSss79dRDfzOl/9Hu2n1jwxOZP0GGsjfneOBGkDcbqlL7FHVLTIEq032vL1hhU6u7I3UNSDC2ZFqbWoUEwLOUIEQEC855V29OB/JEjQYFUmTlTJNxLRLq2t+zaFbW7ebn7zI0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=V6f7Wred; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="V6f7Wred"
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1B7613FE2F
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 16:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764779479;
	bh=l0gnY/UzSbFUAuDU1KntIMiLjASuWWo0nEVW8bui9Tk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type;
	b=V6f7WredS1j0MVj7v/9J24ruCc0AnOf6kopGzdcoLB6474o24YpbBSXjQmm7JoQKq
	 YuU+iBD2eTyCT28PLtk3Id9wbI1QxL5mOwAoHdmbEirYXqdb7h6J7IFRQAaMBiQIBD
	 I1pVc9F2gYwB4y1tb18+Nyt4p5UqsfBJeT1fZJIYqjNz+2gpuq0oaeU4KOgH2aCPoZ
	 4KK+ClbJcilR2ruhjojqfbidXWLXZRzxg9BEZO4Prx8HMiLFOT4s8d41DKgeao+1Lb
	 FFhBkH6fYImSdj0I8I0oM8vvO9742CRjF0/M6T987+U6RjsreciRyLfNJuwOLzRqPM
	 KeyXvR27dHabmgY7RlJP60mkOcytdavBRrwzZgH1Qy/y/QME4UAjfzRYkWhDbA2cPg
	 VeqdRzYL6MlhSj9jhJ4YOFXoLGYsigYdFby5COiSC6gPu9gBvG9uYXCuV4EhaFNmlL
	 2seUYxkpB6ZH2IQbv2RPt+utnpwnAbw2HrPbjuisSEDNVgg+jsQFiI5NYKYZwCSHMw
	 FuW9GyL4NFZ9u4HznMyfXH7TCO8VA/L0haqzd6pefE87M18+M0P3DNgc4MTVGMSqz9
	 CSVpcPB0Onof3D7bkeVXvx+OiDm6QqRx0qsej8YQvSMFKn5uAgewTim0aS87Hv2RGK
	 wCNhHNbqB+D0iaSNqIEP6EFw=
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4775e00b16fso45912675e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 08:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764779476; x=1765384276;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0gnY/UzSbFUAuDU1KntIMiLjASuWWo0nEVW8bui9Tk=;
        b=mYxGbzWltJEkCNYF6FF0QfQ0nmEfzTyz9o2EPaB5xHeAapHzvHf4rZmfCyvxhPz/r8
         yZTvDGueme9h3JcASlLA2cLYw4wUIcI+x8x/B4ChNfxeWDJyckLHfKY9wmGN2jbgLbtI
         eWGWhUCxvxYUIl+aQmBVPuQcNVSGYhOaT3I3TtsVrGhDAd/0PS7Hn7zXVKen/xl6r5bJ
         rG8uNB+OmXpYhqou3NSxVNwITbiQz+3ANUBSNw/12KuYM1qFCBFWxYRc1QOW7Hf6VIjD
         4kJIzKzp44FZ98rMN/7mC/wXanfPwWIGjS45EDpzRGDLfCUJNAthClvRtMnwdygs8cy4
         WgGw==
X-Forwarded-Encrypted: i=1; AJvYcCVxJ4P7Xclgu7f6q575KWux8+RoVZ0eiVOgKr4knKYrjO7625PV2vNE5FZeCZEyeoIRhFw36N41tOlTFEaJ3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88KK1OjJbxjPn3gmsZDACkrFUG4RGZJwTPFgpgDM8J8Bduz9g
	DmxXiuCuCOI9Rn9ApuIvDbgql3yrrph1xWlqWXrsQqs+1/3ww47vwmV7x9aR5lR+zu6j4z0ZnW6
	H1U+AFfUBNGdoZKCrnnIxWjlU4aXsYgvv023PIcnHLDfHZmhjH1vzBc3oVey1PosdV12+XVjW49
	NMVnjwnbP2
X-Gm-Gg: ASbGncvMn3HdGsSDaFquM+lOoWW9VyinwxL67XZg/ra0hqHuBkJnN/1mRuaoI1iLvGU
	Io5UwiFcIGgzAe8G9Kcj3nBfmomZq7DftUIMAtcYIhZ44P9jA0QJOJuAn+yuMIOmCqY/PUoG3b4
	/FpJQYaXOxfz4nDSj4lsUeaXBMMa2zzQdRRQ7eO8K8zkvR/cWGzt0keFXB8FUmBeWLcBReV9p/Z
	mnDvOLnAL4xmWh1J5lIwjoASSbfLWv/QNEyKSr1uaQZfrouPNoqM6CR1/6QvwfkSYPUoLW33wXf
	atAPqlLhTsHllhExtPeOr6vmwb2pTfyz+X0ONucttcUfiTLAFUOQWY2/UyXXdDhfgsPiRwfuwXj
	sc8uIEJc1uwLl8NRK9//38Y53gjhZALhd8HcOhWyR0RX8ydmiqTCqHTG7F7hkWLXvT/QACPL/RN
	8=
X-Received: by 2002:a05:600c:a41:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4792af327dfmr27911815e9.17.1764779476171;
        Wed, 03 Dec 2025 08:31:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCKejq/2U+1EN5UAB8CezRHOHJDvwMZzcFVGMZ1T1ZB5XD8pg1afh59Y/Z4iwxgxyD87hFlQ==
X-Received: by 2002:a05:600c:a41:b0:46e:74cc:42b8 with SMTP id 5b1f17b1804b1-4792af327dfmr27910815e9.17.1764779475621;
        Wed, 03 Dec 2025 08:31:15 -0800 (PST)
Received: from [10.1.1.222] (atoulon-257-1-167-49.w83-113.abo.wanadoo.fr. [83.113.30.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c30c4sm40900310f8f.9.2025.12.03.08.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 08:31:15 -0800 (PST)
Message-ID: <6b25515b-c364-47f1-bd75-8b7dc16e3701@canonical.com>
Date: Wed, 3 Dec 2025 17:31:13 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: devnull+debug.rivosinc.com@kernel.org
Cc: Liam.Howlett@oracle.com, a.hindborg@kernel.org,
 akpm@linux-foundation.org, alex.gaynor@gmail.com, alexghiti@rivosinc.com,
 aliceryhl@google.com, alistair.francis@wdc.com, andybnac@gmail.com,
 aou@eecs.berkeley.edu, arnd@arndb.de, atishp@rivosinc.com,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, bp@alien8.de,
 brauner@kernel.org, broonie@kernel.org, charlie@rivosinc.com,
 cleger@rivosinc.com, cmirabil@redhat.com, conor+dt@kernel.org,
 conor@kernel.org, corbet@lwn.net, dave.hansen@linux.intel.com,
 david@redhat.com, debug@rivosinc.com, devicetree@vger.kernel.org,
 ebiederm@xmission.com, evan@rivosinc.com, gary@garyguo.net, hpa@zytor.com,
 jannh@google.com, jim.shu@sifive.com, kees@kernel.org,
 kito.cheng@sifive.com, krzk+dt@kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, lossin@kernel.org, mingo@redhat.com,
 ojeda@kernel.org, oleg@redhat.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, peterz@infradead.org,
 richard.henderson@linaro.org, rick.p.edgecombe@intel.com, robh@kernel.org,
 rust-for-linux@vger.kernel.org, samitolvanen@google.com, shuah@kernel.org,
 tglx@linutronix.de, tmgross@umich.edu, vbabka@suse.cz, x86@kernel.org,
 zong.li@sifive.com
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
Subject: Re: [PATCH v23 00/28] riscv control-flow integrity for usermode
Content-Language: en-US
From: Valentin Haudiquet <valentin.haudiquet@canonical.com>
In-Reply-To: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>

