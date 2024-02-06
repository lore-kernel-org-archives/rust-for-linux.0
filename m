Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52911111BD
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 14:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231006; cv=none; b=ElnqpDziWrA7NccuRcKU1Sar6EQVwrVjqg/AwplQ2UB0mcUQgBcd1dlv6jY+2dCAOQNSw3BFPwK/AGIm7y24ARO5OYYS9iE7QrFOCujyHLUZcBQWsuLACr0Ek0N0Q5J+NfbJY3X0NXU9/d8E2lluVCvVXlWXV9shmkf40fCNOGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231006; c=relaxed/simple;
	bh=1Zg1QTrihNZVPwqSwW07+LD8l7IlKuSMQcItbBjJasU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJj5IUFLtoI3DLrGz5iYqF5mgjx28LtFdB5XT5r+uL2BavruP25I0tGksVQ3ufV+OBY9chGEBYpQKHly0BX72asW/Ej4L17qrv4e8YHBOdKjqNvLQ67TSnSt08U5TridZjJPci7oTZmarW1QnrwTLmEyZiSj5EzANVcQDJ6oU8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Klh0ui+j; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Klh0ui+j"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-363c1829cfaso9051845ab.3
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 06:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707231004; x=1707835804; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JXF/tl0S8c5UWlObr56nrfZQQ/DtiwHU7UPIEQFbWnI=;
        b=Klh0ui+jt7QaRFrvcMNO6r8BnQ9pKNk71D5QC+4sMkFMMhZkD1ZR92mXa4iLkrxYts
         XvIajOVopBkmBkhz/WDmdDyJN/K/B9v/oe6lZHtEs3IrGnUtfEqgRh5aMij4Z8YORlMz
         QKe2bCTy+X/3SycS3ahXKXDFlZjM8zTecXIOA2TYkpMOO2NpCwSkxJJ6qgN1PiTkBK86
         eKVqhq/3c3VUOyn/bEZRSuVl+HtoumOO/PQFhNr6Yu6GTbQSSAFxwb12c8iVjWOm4jOW
         /bzcQzPGCzeICyNkce6k4Q5QNuW6/zJJzEau5TKVmNKpBsO2bower54dp80k+ki+2CxZ
         elTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707231004; x=1707835804;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JXF/tl0S8c5UWlObr56nrfZQQ/DtiwHU7UPIEQFbWnI=;
        b=HZpVgzn/4HdAcHkeAPiPNnTXhYbwFl/1Fo16Av1Oh1JX4hRhSQOTEPHuv1kB6hbkDU
         ooIZ1owTtr6IXeDcgGfHAhHsDLEiqTtlVFap6mFvncysByAsRb+7FZFILBk8UGTKqE9e
         38FLqfmVGGSe87ntpLBO2wiaii0/zehWCDyVtBggWEoE677iEx6s9cDL1uPiX19TVAGS
         eVs5EYN1g/hcFeH9Gj81hDABM1i2WregTb39yeK2BvZuVYo6F2NKdDl2YY0WYlxfC4/J
         J9cLU8hqMO56IylDbiR3uEIwnYVRBXKLg7bHx4p2MksVa8OG08h85oZgyHXcBcpG6Rce
         O16w==
X-Gm-Message-State: AOJu0YydlWCN0gZYjNo613dkP4qFVlNzZtLBy5VRBDWVVbVdJPs3IaVl
	ppe1UPYiJDnm7V6hd5Uc4QfEtpWCB/AvVVBk+YWR6WTkAigWBbf9
X-Google-Smtp-Source: AGHT+IED10VgOAOPDhXeFLjejEQsJ7/LWeUf4722n5plrsTbbhsFoQlA4b89IE4as+4Z81BSuDNb6w==
X-Received: by 2002:a92:c14c:0:b0:363:cac8:5c34 with SMTP id b12-20020a92c14c000000b00363cac85c34mr2883848ilh.11.1707231004275;
        Tue, 06 Feb 2024 06:50:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWNaEDteaEJDIDujHgDP4BGRf7sei6SckLxGOL9wsh2Iq9L9iJLfjmcKwMNc4UfbnprPUvigu8OZyBC89q210EnUfinHT71TPlHk1vYH5Gkcj33IxHclbQXczhHFdnIKjSbhnoo2IQWMqxv134Q50LqzHg855Bfqte8vlcLVLh5I5CsRGWbMJ7CFko9DIjrQGDtaF/31woc09DAwLBCkT+ovSQob2ddtFSTYy3kzOmWJJ31mfZT
Received: from fedora-laptop (c-73-127-246-43.hsd1.nm.comcast.net. [73.127.246.43])
        by smtp.gmail.com with ESMTPSA id b17-20020a92dcd1000000b00363c584361esm542788ilr.80.2024.02.06.06.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 06:50:03 -0800 (PST)
Date: Tue, 6 Feb 2024 07:49:59 -0700
From: Thomas Bertschinger <tahbertschinger@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Greg KH <greg@kroah.com>, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, rust-for-linux@vger.kernel.org,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in
 .init.text
Message-ID: <20240206144959.GE296718@fedora-laptop>
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <2024020646-browbeat-cozily-0bf2@gregkh>
 <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>

On Tue, Feb 06, 2024 at 11:51:35AM +0100, Miguel Ojeda wrote:
> On Tue, Feb 6, 2024 at 11:01 AM Greg KH <greg@kroah.com> wrote:
> >
> > "once" is not right, it can be called zillions of times, it's just that
> > it can't be called _AFTER_ module_init() is over for the file, as it
> > will no longer be present in memory.
> >
> > So technically, the wording you added here isn't correct, sorry.
> 
> The safety preconditions may be stronger than needed. For instance, if
> we do not expect anybody to manually call this, then we can say so. In
> fact, we could even say Rust code cannot call this function.
> 
> Cheers,
> Miguel

I can send a v3 that fixes the wording of the comment; it's worth being
correct.

That said, my intention was more aligned with what Miguel suggested, to
say that user-written Rust code should not call this function, rather
than to claim that it's impossible. If there is a need for the
init_module() to run multiple times, it might make more sense to put
that work in a user-defined function that gets called multiple times.

On that note, does anyone know any examples of modules that call their
init function more than once? I might go searching myself later to see
if I can find any, but in case anyone knows any off-hand. If there are
real use cases for this, it could be good to consider those here.

- Thomas Bertschinger
