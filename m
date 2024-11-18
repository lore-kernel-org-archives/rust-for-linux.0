Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9784A1BD9E3
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 16:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731946771; cv=none; b=TYJwxhEerD6qU8WdUrc6ukOA+VHBClKxKjQkXezw6YtyNZoKk+3fe3jBQ7ODJS05BaKcNcWLgGpB+prdSRG5rnCq6oXsiuuv1BMWIfh4ABEhvqKmrlR0a8o5xQG5L8Y7uO5I6VwWgf2RXPGvFWcTzWcWf6M2UWK3jLwpqnEXKj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731946771; c=relaxed/simple;
	bh=nn6nhxbyYco5IyblqpapFVvcwS1K2q4oUWaUUiEAaxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAJTzqhyRHKoQdNk6OvZIabwPvIS3zklWjvoFimUjnqx9M47Fpha+GHCSIMEP4sc1hfrlnu/f4YXnCPNnDk7Z7hKJP3Si8npQvnmyVfRwfswbXj1XPSvlWBjdO6P5SCFjvRu9S7xgLJsxSvDOgN4zrPY9X1wly3JcjT+shZT9UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in; spf=pass smtp.mailfrom=iiitd.ac.in; dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b=hthI2VJi; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b="hthI2VJi"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3a6c1cfcb91so18293495ab.0
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 08:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1731946768; x=1732551568; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f4sIP3a5Y7yZ20sLf0pjyU2t67TpESXXeTlO6U+6vjE=;
        b=hthI2VJiY5U2W5k883WrU6OeSnPSWGs36QbA72KAY9gOZqYYaBrCLX+plTtmoLK06/
         /OWu5GjzPQai4ZG/Ldo+ptww/QcOoVFNVWIsL/8Nj2WbhNspc7K3rqPxju1fg11vAd5c
         CwIZf0eg0wQn0STb4PsTX7v6NJMWNE4QbAtUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731946768; x=1732551568;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f4sIP3a5Y7yZ20sLf0pjyU2t67TpESXXeTlO6U+6vjE=;
        b=oQYVPmmPsvrMClqQPTvQjdTWZqO9eQ2zcgqaD9ffWno9Yx2DT0QfA2WHUUhcwyXzSs
         yYpArvFJqFloc7u+MKmSmoUEg+0ai0Dxej4zbH+l9CMN95xyub5tbstWHk/rxUpO7Y7x
         CHF2DYy4zu3CCoJXb/39/nqDK+Bfgj2i2CNvWKNHzjViaVJ/kI1JOuCmsqd62bWRAL+W
         bHCAeRbALd1bLx5LfinKk6eclYDULEKk+UIJRAN/CokYxm3PF/rvMoRDq4JSgrORuqis
         w5ob0KTMds11Usr0bucz4MboGFPrlI09uGAvINLe2h08t+tmUc0IOrd21Cx2DH2NKmeX
         glug==
X-Forwarded-Encrypted: i=1; AJvYcCXp3g8jj5ZQFAeZcKdSEYV77NVzQYyV8CCV5UR41FBhT2G5BXU+RzoVTaCeewJ3f1kqw2J4dC4gNvoT+lQsdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKrb4nI0mJPdddp3GD4J214ejp9osaVRilco74lubqpPcT+vMd
	yykqpZUqEYS7L0r/2NqRgXFjZxuPkSKK4g2GxLsB7+Raa1fdALvq55EMqHYocbE=
X-Google-Smtp-Source: AGHT+IHS6LknM50XZ/l/uGyomDxxaBCYlLf+Qj+0WngRoN7i4MUqVYL475pwMl6skALNU8aeRVA+Tw==
X-Received: by 2002:a05:6e02:1a02:b0:3a7:4674:d637 with SMTP id e9e14a558f8ab-3a74800e1a5mr159789725ab.3.1731946767801;
        Mon, 18 Nov 2024 08:19:27 -0800 (PST)
Received: from fedora ([103.3.204.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1dc658csm6121771a12.69.2024.11.18.08.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 08:19:27 -0800 (PST)
Date: Mon, 18 Nov 2024 21:49:13 +0530
From: Manas <manas18244@iiitd.ac.in>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Alice Ryhl <aliceryhl@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Anup Sharma <anupnewsmail@gmail.com>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: block: simplify Result<()> in
 validate_block_size return
Message-ID: <6cpv7guvce2ylp4n7etyic3nuik7dvb25uxtmewjpz4z4ow6xh@x7j3627xhiel>
References: <20241118-simplify-result-v3-0-6b1566a77eab@iiitd.ac.in>
 <20241118-simplify-result-v3-1-6b1566a77eab@iiitd.ac.in>
 <CANiq72mzCSmLG0_Vqu=sCO7TBPzXtea3HPw5TjT_gYKEh7_1NA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mzCSmLG0_Vqu=sCO7TBPzXtea3HPw5TjT_gYKEh7_1NA@mail.gmail.com>

On 18.11.2024 17:05, Miguel Ojeda wrote:
>On Mon, Nov 18, 2024 at 3:37 PM Manas via B4 Relay
><devnull+manas18244.iiitd.ac.in@kernel.org> wrote:
>>
>> From: Manas <manas18244@iiitd.ac.in>
>>
>> `Result` is used in place of `Result<()>` because the default type
>> parameters are unit `()` and `Error` types, which are automatically
>> inferred. Thus keep the usage consistent throughout codebase.
>>
>> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1128
>> Signed-off-by: Manas <manas18244@iiitd.ac.in>
>
>If block wants to pick this one up independently:
>
>Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
>
>(Note: normally you would carry the review/tested tags you were given
>in a previous version, unless you made significant changes)
Thanks. I will keep that in mind.

-- 
Manas
