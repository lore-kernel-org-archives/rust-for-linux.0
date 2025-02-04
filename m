Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C89211A24
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683113; cv=none; b=aGeCKwDTQx0YbvvZnz7yRITVbn8vQtHAqIrNAkwVr08lwxplhoSbEXbJj5k6cQ9sZoC4d0isGFvfgRIgC7dNe/7uucdHxafOgZnbwGVa7MtfN4fBhMYj6PMiU+M4rm/gfKvAerD9W8o73DQmqGGKXSdKf6fORIhcf5y9ptBW5rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683113; c=relaxed/simple;
	bh=y/HggLJSN+3EivXP89QktPNjxkoD2eOJwHrHJpo+/Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GItNszgRssomxpsY1rTQ1iguZym24YuDu8mdnbrIt6zItAACDnIsvdCwghlY9jOmPr8+XUhJML1y/62qpy9T0yhp6YGtB2qreH36k0SqJDKvKyI+OfJSe/8w4WX0DO8sd/8jpF4SdnY55cxvoH1Gohot4LxhMeAg+Q1dP/iN9Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M4G6UFHW; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M4G6UFHW"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e2362ea655so43612756d6.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738683109; x=1739287909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+6vDogQZmhVzdQ5E+BOKChoBdDnjqfZw9znSsTvbUcs=;
        b=M4G6UFHWpy8gYFRXRRqfV1BKhkaycVWu2i+QczXlSxVjfIaexsh5y/IK9Bm7m3vz1e
         8L6EYrDNgYQd+CIJDXJbf9ahEVltQ77J7T0BKua1EImZI/eXHHnofhN1FdQ2bUuW8re6
         6tvGePcdgLcG2EM2yQ1OVNJ88Vgl4fD2pB6YYUZzexgAQwVvQMv/7/a+lqt8qEV7+glS
         sgXPaVNAUswg6kdjn5nj2LOSncFmGFa7QCAVfYyTWjKh0NkOvUDqr5Ap3kXk6QbKwW1Z
         hK1TpY4ZqaeF1R425YPx/t1+Jp0vijJtG+fTHnon9/UMttMtH+GXj+Xfbl0MxdtB9mgX
         eM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683109; x=1739287909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6vDogQZmhVzdQ5E+BOKChoBdDnjqfZw9znSsTvbUcs=;
        b=vyRP3SPObt4HBk/I8ILV/AI6AU8vHwJyZu2aKr4FoPrombTrPMdImT56/G6x7ZF818
         8npZElWZ1I7hWM5XkgZEkC4al6BYhdxp9YIz1AB0Mk2JODJBg4ayAquXmZ7IzXtX7X4L
         qihBb8ob7feHR0oqy1yfQr2P938YYG2dMRqS1PtzRjHApNJqU/a0MeYWl+3RNv7HqQGB
         U6joFJrNxRfioscV2AbEQO0tOx3/uDQ1Ux4w+bb1LXqMkpULw0X7BTRCHvO6WSALEAms
         QKXgiJn3TCLGcONP1AZ7NlXQspiK6MwhDSX7K6bT2YI7tNJPVv4u5IGYxOZg9Ysid8g0
         x/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqiXIeg1T5u5qmuvUMmsV6YScNThpmGyz3grJ+2cXCG+nddYGGqPPokTP7GfDa/GAhU8JCRbhVjFH35S5EjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz50uMYit4RclpqsrrNf3kP9zhPY2c50Y98bsXmOZA1GqNAju7d
	B6rDd/togMCjKjf0p08QFEMiZFOOhxWKDo3O8558e6HRiZ+pdfE6rqLcau7qUA==
X-Gm-Gg: ASbGncug22PQeZHeFjgaSxP51DKnRZ5b0MawCIk6AnkP93uhPkaE3NMPmZIsuPMSNfJ
	IFF6YSdLvAYHY2HIZt8JfkvGoEEuATSAz7B55Po4dN2nAI6pWShQ9VbupAk9p9efSb3OVeyG57w
	4PSus0PsIiNYqOuc2tZcwsa6VSyV3Y4Yn2CBnjKXEBTelBRGwS2PFRzFG0jZyi5hagXKcmNKFy9
	RsiJVggNv5zKUOhqSstFDCjUubW/b9wrWYkBMr7Wt92wpTKPyQP3pw+UIVujBDFroAIBIsCGrQs
	Jhlyypag2b2U/406RV/HsxW/Xq/Z3H3a6A==
X-Google-Smtp-Source: AGHT+IGr16xztzaU5RVdUQ4EEpqABDmb/hiK2v/XZRwrNmn6sD1FtahgAqVWBvE/dHbzuTOuI+PQKA==
X-Received: by 2002:a05:6214:19e7:b0:6d8:a610:21cc with SMTP id 6a1803df08f44-6e243b8f713mr344012086d6.1.1738683109138;
        Tue, 04 Feb 2025 07:31:49 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e4168d91f4sm30300316d6.58.2025.02.04.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:31:48 -0800 (PST)
Date: Tue, 4 Feb 2025 10:31:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <28e9ed5a-9437-4a53-a099-a8df27ca8a91@rowland.harvard.edu>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020424-retrain-recharger-407c@gregkh>

On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---


> +/**
> + * faux_device_create - create and register a faux device and driver
> + * @name: name of the device and driver we are adding
> + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> + *
> + * Create a new faux device and driver, both with the same name, and
> + * register them in the driver core properly.

Along the same lines as Danilo's comment, this routine does not create a 
new driver any more.

Alan Stern
