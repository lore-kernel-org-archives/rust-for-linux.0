Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1FC56B61
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 02:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707185629; cv=none; b=jsWKMxmgkvGqxok8zmzcfCbjOKHrh1jodnTf5a73JYI5e+iln7v7uqCyMlQp7vDN9bcX5t5hovIMq8AZfMXM2Avq/SgaDsddmGqP3Nklta6xiqIwDrd3OWKTxREikh6ioM7HLgc4k23n0ZZnw2Lhf16gCDx4rdPhaTmB5Q4Tz7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707185629; c=relaxed/simple;
	bh=Rpv1NA0MUdU0wdc0e1lGGYH1JH79JzgBDScuaB8lXow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYXD+22j70n105dTdKKnZ5vRivuN/C6l7qU/sWK4eWCQ639+SEdwEyfa8U3l6lFZ53YViH0KanMM95MgVb0lgAq59M6AQJQ0FhkwIfx92sWFkgpRGlqGuSFwHHcH3QaUoL6bCyDANiKHQKQRJciMlTYMeJn156tLQb3AMLodAJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBVJEG+V; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBVJEG+V"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-363b37b6799so283095ab.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 18:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707185627; x=1707790427; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VEs9U8hss8NpwdQN7KcUkphtBtvJGi+IaV2fGowaiI0=;
        b=iBVJEG+VqLTPiSldnJXZfZgDsn1gKwRxoOZQpRzFF5bRFt9Jwiu3vhwH3dGpd0Mxxm
         SuVuTKu79H2H6fcn+DLZRLqkiuNWQ1iGYlTTRIgDhXjBXaTvSkA56D6w5FJohZZpMF3t
         Bw2M6ZNe8UyTj3oRsYuMNrzSRcJP6aH48UHGZ25CzNlHEsnlc8rY/7YtWmpG8SIxo/p/
         s1lMNqPCnkEXxdBJRf4nKeAsAT+hhNGx6prG6cXPdxLZNEqDe2Rp+4kZ9c4Uab2BjcU6
         QzoucSDcmgQHv0tdOO/UGVaxAJAtQ3bWWAIFl0hOdPJaLAMqpKsUYZYWz4rRm+Phm6sQ
         9Xxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707185627; x=1707790427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VEs9U8hss8NpwdQN7KcUkphtBtvJGi+IaV2fGowaiI0=;
        b=BnKoLtoS77VpCNGaDF4n6EsC7P+knKerqXaSDN8LdjsyPGrfMXJtLUBOd891OcsZu5
         ueTT24ZsDry5kif6FRrAG/hsH54yctns2KHlQ/Cy2umEixzJJjQm99pEnrApwhQLZLSF
         VsrDW6C8Mgy4MPkxqCwF+SWDvsnQ4siU1x0D0cfYRKmCoEDnA8yH79nPMPTJ4CAnLVyB
         7Rq2/5et72Wxsd8hE8omOqP3dNi+Tbr6KQO4MJmn3cIdB+LOCaTtdpkqbAlXD1dRnUF/
         sgMNyVik9uxaHJN8t+5CjE5KjQTF9IWzxQ50sVegn6m5EXFsfldM5hJE/Ht6RUTFGaIM
         SB2w==
X-Gm-Message-State: AOJu0YyfFb0DFM3t4x5KmKeNuVxFWVnq8lFWdH+wxDWCRazs3mSGhnGb
	wzfsks75Xlq8B1UKRhrBrma71HK5WVDtEqepCghi5Ezet3bXiBSZ
X-Google-Smtp-Source: AGHT+IH2wIdugA533vWKoMR9Vf0QfleyUgf9mODgVEfPeZdIdQU59FYaOwGajdO9+m+V1LQK+Zm3lQ==
X-Received: by 2002:a05:6e02:ed2:b0:363:9213:f8db with SMTP id i18-20020a056e020ed200b003639213f8dbmr1131665ilk.7.1707185627383;
        Mon, 05 Feb 2024 18:13:47 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVsGzY5koWPsCEKQDJWD/ZFjT8BKYYcRYqBTRcOLmYFN4HArVQxB7b8LNmH8quOYIeNT7WgFBKMSjV9kdYZX9tZ8Lq0+qdviQYKG4n8fD+inAXu3AWdIZHLrxXZPvnRjjxzq0aGDYic9j52Qbbb1t/FGPKUXNycCYbvNq2kWjY6E1GBu2vkrz83uv4p/RA36w==
Received: from fedora-laptop (c-73-127-246-43.hsd1.nm.comcast.net. [73.127.246.43])
        by smtp.gmail.com with ESMTPSA id y12-20020a056e021bec00b00363a91effdbsm261524ilv.76.2024.02.05.18.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 18:13:47 -0800 (PST)
Date: Mon, 5 Feb 2024 19:13:42 -0700
From: Thomas Bertschinger <tahbertschinger@gmail.com>
To: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in
 .init.text
Message-ID: <20240206021342.GD296718@fedora-laptop>
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <c5a8d670-2574-4d64-8928-d606968f360e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5a8d670-2574-4d64-8928-d606968f360e@gmail.com>

On Mon, Feb 05, 2024 at 10:39:40PM -0300, Martin Rodriguez Reboredo wrote:
> On 2/5/24 22:25, Thomas Bertschinger wrote:
> > [...]
> >               // Loadable modules need to export the `{{init,cleanup}}_module` identifiers.
> > +            /// # Safety
> > +            /// This function must only be called once, during module initialization, because it
> > +            /// may be freed after it returns.
> 
> The thing with this doc comment is that it's going to be hidden because
> of the `#[doc(hidden)]` attribute. I think that it should either be a
> common comment, placed elsewhere or removed.

I went back and forth on the best way to comment this (or not). I am
fine with any of the proposals, with perhaps a slight preference for
removing it so as to not clutter the already somewhat busy macro. If it
is important to keep, then I think a common comment in this location
makes more sense than moving it elsewhere. Anyone else have an opinion?

- Thomas Bertschinger
