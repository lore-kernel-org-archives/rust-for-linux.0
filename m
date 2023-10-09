Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318593588E
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="LEZzENd3"
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D593410CA
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 07:21:13 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 859B33F699
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Oct 2023 14:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1696861272;
	bh=B96PVjO/dQ3gfVlhgj+phv5BjtntXKadFzqOCRy8X5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=LEZzENd3Apw8U/A2X8k9QaHpAkI3V8KktjoLWg+Ti7dILU7+JD2lDRdp+p8X6Nhx1
	 mvFZASIOSD5Mn8hLuen9/9jLDJLiPpoPUkDps+U5hLVM8kiA6fJmBcNNa8o5GY+0Zx
	 raVSz63jUG5i3RSueT/l5Ab3c+tUrq6cpUzSaTYZ24oywX+GccXbk/LLxw4yrUD4ep
	 51mCfayIyMKtt+8+3qwQRtJlzD9XbPI3FkToCrxP2xUXhzZmep7oUCmjMAzYMapoPo
	 H/6p7KJ2afjdwVq8eIGLuo3Anam9ZXYGGroQ0etWptj0c4Y6M38NFvq7Az9kS9k/DL
	 ua2aQDWSBIVZw==
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51da39aa6dcso3710660a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Oct 2023 07:21:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696861271; x=1697466071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B96PVjO/dQ3gfVlhgj+phv5BjtntXKadFzqOCRy8X5o=;
        b=JsBvsHyRtKFzBgxvdckJDj52jsyPdNyPdna+uf+zsI9a7MyGMJpvKa3Yl+ujQ7Q1V9
         XT1tFi1fF0dlNgbiDbJiiKaostFhPBq9NhZFZTxD5bKQAt5tFG1AjPqrRzMSW3X03IBc
         ZZQJjHHOMbtsxOoHgP71Azldrxm/zt/85s5P5UCNcR45DLDgzyAFW0afeIu5oMoHT1OV
         BHoAgRCZaavVLcaO9qu3enI7ZAhs6ZWauWwuDMd4u2U3hDbQiiZeVA6/RVySwTQsjHOS
         wJRNAe4eobHwgSH2k1shVD/27vQH8g/TcwUge1Fi7x3SQCor4jg6JaJQzHWqYPAy1JRN
         7fAw==
X-Gm-Message-State: AOJu0YzL/d/K/nslOPb66GxI79cKgu2HGv5oWqJNP1p4dzV6TUv8gMQ9
	Rucs05fTb79rTqr2fLlFC7aWyJxrXBrt6QOkcF8dIiaCWcgUGn9c0p5CwqU+FzkUuzbDfkDZ4os
	LT4XRQusP+xWwzXNIwX0Bg/+t++Qzxut93F+roWCPhD/9
X-Received: by 2002:aa7:de0b:0:b0:52f:fa53:9fb6 with SMTP id h11-20020aa7de0b000000b0052ffa539fb6mr13592181edv.10.1696861271601;
        Mon, 09 Oct 2023 07:21:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGN5uHW2mQbyZfXtLTo4TlVZ+BI37A+D7RKCe90j3APgcSY4/uXNoFPWjpcwltgcTAQgtkoOA==
X-Received: by 2002:aa7:de0b:0:b0:52f:fa53:9fb6 with SMTP id h11-20020aa7de0b000000b0052ffa539fb6mr13592151edv.10.1696861271298;
        Mon, 09 Oct 2023 07:21:11 -0700 (PDT)
Received: from localhost (host-79-19-77-113.retail.telecomitalia.it. [79.19.77.113])
        by smtp.gmail.com with ESMTPSA id j13-20020aa7ca4d000000b00536275c28dbsm6058070edt.94.2023.10.09.07.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 07:21:10 -0700 (PDT)
Date: Mon, 9 Oct 2023 16:21:09 +0200
From: Andrea Righi <andrea.righi@canonical.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org, greg@kroah.com, tmgross@umich.edu
Subject: Re: [PATCH net-next v3 0/3] Rust abstractions for network PHY drivers
Message-ID: <ZSQMVc19Tq6MyXJT@gpd>
References: <20231009013912.4048593-1-fujita.tomonori@gmail.com>
 <5334dc69-1604-4408-9cce-3c89bc5d7688@lunn.ch>
 <CANiq72n6DMeXQrgOzS_+3VdgNYAmpcnneAHJnZERUQhMExg+0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72n6DMeXQrgOzS_+3VdgNYAmpcnneAHJnZERUQhMExg+0A@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 09, 2023 at 02:53:00PM +0200, Miguel Ojeda wrote:
> On Mon, Oct 9, 2023 at 2:48 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > Any ideas?
> 
> That is `RETHUNK` and `X86_KERNEL_IBT`.
> 
> Since this will keep confusing people, I will make it a `depends on !`
> as discussed in the past. I hope it is OK for e.g. Andrea.

Disabling RETHUNK or IBT is not acceptable for a general-purpose kernel.
If that constraint is introduced we either need to revert that patch
in the Ubuntu kernel or disable Rust support.

It would be nice to have a least something like
CONFIG_RUST_IS_BROKEN_BUT_IM_HAPPY, off by default, and have
`RUST_IS_BROKEN_BUT_IM_HAPPY || depends on !`.

-Andrea

> 
> Cheers,
> Miguel
