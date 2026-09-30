Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71707501291
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 14:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778883; cv=none; b=JxEqQ6ajylV7OFCU0crcTOnqXrb46GV8khfhaHWwfnLkiFFugDMESA/bzyOnknr2hb6TmKdpcf3/JoRX0FGMDRAuDZ6cu4b2MZj44hkuj08Ryn12MIuG6/xHKwUuk5rE2igsRicnoz+t4+fNqMzCoYwPw3FeGKIXPlUzlRzjuT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778883; c=relaxed/simple;
	bh=dpi5FuofdGs2KC0e7Onv0Ee4U3xJJPwiyRHSL+LWSkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwFXwMojIIHnt15gDEL9BsHhoqZUdP02Zwquxgm8fMDnX1LSRyIf3m30Ja4HQsQWQImnqCekUb3Q2oKCsWh+m4NNGj9oBObbq8DW6iF83WKe97osbwiszDHoBYociNG5aPOCpqLC9GRnwIwmtsC8YMsvdC+YU2s5NtlHgppghLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ka+fQutY; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ka+fQutY"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so50882645e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Sep 2026 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790778871; x=1791383671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9WbMv3YGX7nMfLppnaRbgidczcJaf5jYeQSivTTiMGs=;
        b=ka+fQutY8rrtx120UsgquEJDw/7LVnuaihjyyewP52akXkZCj3zGinEK8h6z1Ehuql
         +/cUTw9gqOIxUGNqLlGVJuDsR/UQ8I0X/2YbrKHYO08Tv84hL/rWfBQ+s1D8eLR0Pbmp
         0E07mvGSDUsEbRvQ5rLtcW1zvLfXdSPCrFaU7VX4OriL3vZ1Hzq2UmuQ+NMYv+mdCokH
         Oelh1i0B2sj9iHCXc7UHc882lbGWi69B65AXYEkER0x0iwfRbBU8yRJ0jZCPhbKMeV+O
         iEw0HgdWXpej5A+8NGKwgag2gY2k4wiPn3i2/+x7RE7DoIcjAnPU9PgNwK/xeK/AMGHK
         oukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778871; x=1791383671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9WbMv3YGX7nMfLppnaRbgidczcJaf5jYeQSivTTiMGs=;
        b=AVIym0ZkcTvPL2OvRYQQ6lh6ZO0T5/Q5UJend/IDk0gXIZBQWewsQYoQDAV+lYRUnj
         rZlGL4jLjSf/K4OcUIk0mQlIjZQbWmGzumi8PX6T8TAP170dWDDe7b6+ICVhEHaDpgLT
         iq9hYrRXXBeD0pLqfNrbfEk+3dlEK9lXV2a9FGzWNcgyAEKjewfrAL5kbTOFVr4X85PN
         spZDNTFCe9QMaeKfstvwUq67609jDoqhlf3kwSaMwJlquzO+sSuZq2H7Xsl4WbrMHXGv
         6/JfSB0Dx4ijcwg228ZJbrNh+VolJHLmSS0ZZ1/6iZ1Kw7Namln5RRQtoECoBUSPJ59o
         tPRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgFyBTOEk5FqPOh3wZouP6hRzFrJBI9rYvARmionW/7UsdoMS2i7LpbJ11KDXXuyLZ3W3c1qr3FEKf7cWERQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kam9po3suRlkNJFKV2pXrId6H5wTphKbQ1tea2Nx/dcFn02c/f
	h5rau3S9ugW8XnZAvm9St5T02lBiX2YLa6V7eM7AubQI3Whp8JJtQcAm
X-Gm-Gg: AYBFou10wdaAejldMy9ikwmpVFjLu6JVEHSFuGDc3x/b7EnwJUc+IzUR2bLQKst6FHS
	Bf4XYe4YeFlkqw9NH2pwGwew3MrPxGvXVIvGD5w9BwW1IaDG3zeEKlKqRQsaGJJ5dip2AFt0ZyQ
	n3XMrKAAQxwMOlZlerbfiyfAWti0ztgdy7djdw+1649X/zqWI3IxQqtfN0FpWjajNso9vESZdUQ
	JxR98KDQvsggdXhC7U1p+WtWaRqTnpsZY774eErE3R+4rsqkm0ww4qaX5JZ7GB36Il/1MIRd5/g
	hrv3MQlvkzmfu9tTfWoNqSTExfOY3/wizKbG18YNi70EmabB90cw8vNbrgF6tuSxOPCUs8O/aj9
	45Huu6LQAmIGy+18so/COwMzW1AcF7n0a8bNkFYqUN/sFJ/fCk8AtgclCQLZdo0rAQ9/2jAG7t2
	gK8Wh8Szmix+Sh/rhP4A8Geen8bZgeRqiBIgX5bmbtbphy5r3NYl3581WRjGqgMeVFb2GR1Ohcp
	p/lLgRvOXU5pTCcQFQBWTzD9gqlknj3lhel6RXegSUJQuYwXElut/E=
X-Received: by 2002:a05:600c:1c10:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a01ad8f2eamr34710865e9.3.1790778871080;
        Wed, 30 Sep 2026 07:34:31 -0700 (PDT)
Received: from C422HJQPQG-Fractile ([80.87.19.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e42ad94sm4577045e9.1.2026.09.30.07.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:34:30 -0700 (PDT)
Date: Wed, 30 Sep 2026 15:34:21 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, Boqun Feng <boqun@kernel.org>,
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
	stable@vger.kernel.org
Subject: Re: [PATCH] rust: bindings: fix VM_MAYSHARE blocklist entry
Message-ID: <ar0d7Xl0py6plis3@C422HJQPQG-Fractile>
References: <20260930123645.302318-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930123645.302318-1-ojeda@kernel.org>

On Wed, Sep 30, 2026 at 02:36:45PM +0200, Miguel Ojeda wrote:
> Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") added constant helpers
> for the VMA flags and blocklist entries to suppress their direct bindings.
> However, it listed VM_MAYEXEC twice and omitted VM_MAYSHARE.
> 
> Thus fix it.
> 
> Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Nice catch!

Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
