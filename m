Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795562296;
	b=lu7jjyx3iRpeVt/PopmyR5eDPdbQejtbkrDnCz6hNr/hhhgeqMiKF+KCc1iMa8a5xIHM
	 2OO+dgN4ScDleoZ+VDbtBMACgB+jOkOI2biNugFEDdiCpsbXB0eDUGkt6yj6bco4SNa9d
	 Du+gK2Ao5fA7n/ZtvXKnM6jidSpxEiI6gTaWLsMH6H4k5cC8CAA2tNPg5AEjMgwRQ7Glq
	 t5vyA2Dh4xKbaUvTNdRJMYLpqszckjyOFeYeC/ZKGTROqGBzbZVoMtbs7xyoGHyWM5FK1
	 8kjVzhED0V38ZZMuQFFoNHzlj9jsZs6giOrDz18siJe1n+wuk2btdh9GCzQBwwKvA2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795562296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=tYh8DQKbiETTaVJq9yQgdC4K/jMzt2M4sjI+EyJr+h4=;
	b=dRjPHTgmw5bONwQWaTVZfOAa446O2AHF2/oVhd3+4EGhqeBeRU/HbX5Oo4Gd6JDPJkvF
	 6/Rm3BeUm/hiWXwUkZKsBYQTnxu9ViUKMGgnmORVt1RC/+Fb/+B2c2BRxvgNbJfHAkmS9
	 sAXsSVPJiYc2ii3qtPSCal/iJXtapLNzeYLzSh5q38PVD3/v7KAjvR5bClrK/mwA+RfWs
	 mSGt7ytbTs2c/9scs+j6APUWA+7Obm/Rj15vt/vq+hPquulWIm9i9bw+8kGXkkZRjdwPs
	 IkgIXNrp4sEOh20k0YbQPq7JtOJ+sDdcuZcuqRXUb+Ilx03tJ/ZSx47pe/k8ZHLLQmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hE4bSa9w;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CF6606A31E
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 23:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0CF6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hE4bSa9w
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55be673e029so991681cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 15:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795562295; x=1796167095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tYh8DQKbiETTaVJq9yQgdC4K/jMzt2M4sjI+EyJr+h4=;
        b=hE4bSa9wgMc5JM80e/QGqpr6OLPMNLJuOlAsIpcTIuSkCeNwSglPdNXIcxLIHOwE6j
         yd6P08ZnnL42ogei4dEu8g6XNqRQT8SBdjDEjO9uYwFrj4JzSxYcvQ0agRqnYK9C52He
         /1rEors4xObnUGFqxEz3w97iUwo5uueqDIj1ogz/6UKBRIcRPeJl0gxqsoWxCkneqabq
         6Lw6YEIXK8WTbHIklZyui25SvF0mb2br+LV+H17y2N2OibnyM5RVOCcZqKbUTdXlKikP
         4yxzB+bb2/+0viadqaRyaH+g0Kg8V8P9BfbmgBrs5j+ZxRX3FYU4ZQOUxPoauUo8mvF0
         BzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795562295; x=1796167095;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYh8DQKbiETTaVJq9yQgdC4K/jMzt2M4sjI+EyJr+h4=;
        b=DgZiRnNYwkuYr+vd5i4ySMEsfZrolvjXYJCZLxZePyz7yrQyD5FKBWMjjGzf9q4/y+
         TXsbBKnfrnHxkQXmhcaNgwatuzf7AdX3dKc480EY6A/tqWBoRzxGp5Zku1IhiIWuMSoS
         oVZxKYtv/eZSXeW/n2HAaly08TO/TUqVsvTLNbBH1U8fXi77KNdlfLue0GCk8XZtKBNe
         nYnzsYHGaBAWdUsOZ3hFuotVwL3xDyrCuRDT7OVkdhGQYbwffYuDi4HN+MghTq6IQD/u
         fBPvAHAI7CeeB23imwfYsG78yqjsa54Dfa5Irb4CjDjCD1F9y9IthtUANqf97yEmDcPj
         v+2Q==
X-Forwarded-Encrypted: i=1; AL+hErGOIMyt9ehweb7SaMqL9sUJPyPbE5+gb5m0m6Ugt9FCrzPsg8exhWMQqoRrzd7Wqt2wbycr86An9wFvSfgTDA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9M7DabVxkmZCIyxBiGgzZjCC/dvWZJLFR90D8Yoaod0L57kEhF
	vJN3LId8xtx0GNPiq8XqGNZuRCCtyLg64Z8/NWdLFB1/9ycH8im7k7M+zeaO47k5Pw==
X-Gm-Gg: AZFdTZeIkKoD9eKrCKcoTc8EOl4OWtWLqLRKWr7GSo7S3UYsJ5qlnH/N8LfFdHXw+5n
	pckHu5jroL34LIXWuMA53vpODqtkzLkv7EguSNTZyJshglsDycnx5i2uP/iKoGbWpgaIN6WY1Ev
	m4UD/ug+bmerMIv/FPeYAkU9q3LzAp3dpbfdBqgYg9eOEAwA9QA9ByJUI1eJB2/IqCSBLbSrouG
	1GXPWHerxsK1Kp1FmricE5Pq5KBE/sTd4X/0pcAX6GIrCkUSPNZoXSJi0gABJetdPbcaTZiZxwg
	5gAdGrrFrPozF/uUu+DP0NlQjTJDPa59c0+mXYiUmVr0zG7GtKo+ikC3EC6ESX+OC+WovdEDafH
	rFOMv8kllLj86zkxgjkFpnS10JdtswF5vXyBtlv05f9CeX2vCwzreAWix9Wwyx5wj10J5MErd2p
	beuceAEiP0ytJgpeAUv6KGBanLOtylXnURMje1xMTmatf0k5/l/s26zslc0usthIHOoLgIomWyd
	GWe+003MedJhS0UWeTmjp5OT8hPfeF6na8SQWsuZFuCCn8LZCnL0jy/gi7IkUNUZ5QnQ1fZ+Ndy
	Usl/zpewnQa2rhP3AO5N7ddyCFyGalpaxhh6hO1XFMysuCJJScUGehFzXNAcR3DlhsynJ4P6
X-Received: by 2002:ac8:5cd5:0:b0:55b:d494:187f with SMTP id d75a77b69052e-55d881708admr66731661cf.5.1795562294169;
        Tue, 24 Nov 2026 15:18:14 -0800 (PST)
Received: from google.com (15.79.125.34.bc.googleusercontent.com. [34.125.79.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7888fb27sm137434701cf.25.2026.11.24.15.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:18:13 -0800 (PST)
Date: Tue, 24 Nov 2026 23:18:07 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Giuliano Procida <gprocida@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org,
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-modules@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>
Subject: Re: [PATCH v5 0/4] clean up EXPORT_SYMBOL_RUST_GPL
Message-ID: <20261124231807.GA1736509@google.com>
References: <20261112121512.1670347-1-gprocida@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112121512.1670347-1-gprocida@google.com>

On Thu, Nov 12, 2026 at 12:15:08PM +0000, Giuliano Procida wrote:
> This is a complete rework of the previous series to switch to assembly
> as suggested by Gary Guo <gary@garyguo.net> in a review comment.
> 
> The first change in this series is a miniscule safety fix that will be
> obsoleted once the Nova driver Rust symbol handling is itself cleaned
> up.
> 
> The second and third changes switch symbol export to assembly.
> 
> The fourth change tweaks a related test file.
> 
> Giuliano Procida (4):
>   kbuild: respect skip_gendwarfksyms in cmd_gensymtypes_S
>   rust: convert exports.c to assembly
>   gpu: nova-core: convert nova_core_exports.c to assembly
>   scripts/sbom: update rust export macro in nm parser test
> 
>  drivers/gpu/Makefile                                 | 11 ++++++-----
>  .../{nova_core_exports.c => nova_core_exports.S}     |  8 +++-----
>  rust/Makefile                                        |  2 +-
>  rust/{exports.c => exports.S}                        | 12 +++++-------
>  scripts/Makefile.build                               |  4 ++--
>  scripts/sbom/tests/cmd_graph/test_savedcmd_parser.py |  2 +-
>  6 files changed, 18 insertions(+), 21 deletions(-)
>  rename drivers/gpu/nova-core/{nova_core_exports.c => nova_core_exports.S} (62%)
>  rename rust/{exports.c => exports.S} (72%)

This version looks good to me too. I agree that using assembly seems
cleaner.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami
