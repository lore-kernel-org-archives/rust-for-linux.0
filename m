Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8090B10953
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 22:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705963122; cv=none; b=OSZ7KzfI33+SrtAu9VXfAU3bQ4/0VW6RkrS3GVYMUoRFpvv+BU3dMxdxZv17QmFfi0W8MpC3WF7dBayeJuCd3iJpLuKElp/iu3GFEqCEs5KTxJOREt/pSdY4qXL2u6sOGzEyJG86YACG37K4ScTKO2Rxp45C/aJBZhH2uiErX5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705963122; c=relaxed/simple;
	bh=hZdkVnfwFjmDlBOTViB0mMy+VBl8pl2Yr2tuAbWx04U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=M8G7bjje34yPPmcoYJ+noDjvR/DoAqdUwN1zPjegEx5wxfuW/Ub/X45oAxY5NpLsAvsYERDgpXSZVfLAbOH2t1y+yA/MVHLv3vP/UzcFrFY9HXo2uFraAjT4UQ4JjmnnRh++XmzY/5OZ8iV1jm+XYvDrn/ztx3yOTvdjsWzys3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZAU+r2Is; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZAU+r2Is"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705963120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aFRdHTL6Ly9q0NNwJrY/4XvTerjAxGUKqujlL2DaAm8=;
	b=ZAU+r2IsTd9KTatFc44zndyVV6TADBtGJ2QkoVEdkI/544CRjCLQJFr7P6WIgoBH28pV8J
	kx0O7NuuIm7XyGzO0M0jDRbUe3SXKp+85Ys6+mwv2qr6TfUiCOM3iOfdd9jC0k2jwdVFD2
	WdHvsax5TCc5pqf+8me7VSYVFJGaLNQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-OrFxTwpBPIuP2ol78LCnlg-1; Mon, 22 Jan 2024 17:38:39 -0500
X-MC-Unique: OrFxTwpBPIuP2ol78LCnlg-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3367e2bd8b0so2706326f8f.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 14:38:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705963118; x=1706567918;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFRdHTL6Ly9q0NNwJrY/4XvTerjAxGUKqujlL2DaAm8=;
        b=jUsIF8ZxCTxMcuBqZeIvPjm24SnlNe15EZCMJw+4gO/VTzSpSu3faiGX1GhwawNxBb
         Y4mNjhUIRMLlGrvAOFrw3DorcLPuTELrc75fLIR2Tk0IycXkH+LuShIwP+vOlNkQlxCU
         Zwdr1agVcJysttwh5k7gNdi5vro/IhFAdQpRhlNb/54bMA0knRfly6+xx1WF+vX5Cj5K
         vlihC9VcQiv+iGVCHQFGXD4dkNcaZCZX1ok49525cG8bg0DDzXhxuP2zEoZFJW+TWs/8
         BEbzATkbcamkONjhpOet89fDF4ZuMdamEEJvUlFkmNlwL9NjsW5QeGByziLGTYuIUtTR
         iP/w==
X-Gm-Message-State: AOJu0Yyg/0zqgt1i+MJARNHacGjWSLA/OaZS65BYoKPXKzcyiabOrW+a
	PM7o+jd8SRljI9TB7JHUTsnU4lu81vu5y17N7HE7nIrGBCPANFtME6xjIk10BKDif0xCopwdmJ0
	4U5SdBcIJdy6ECEBSwzqcBcZgdMCFaiR1PurCfD1jHK8Go8gp96QBHnk3d1U9+MSc
X-Received: by 2002:a05:6000:71a:b0:339:23b3:124c with SMTP id bs26-20020a056000071a00b0033923b3124cmr3058614wrb.135.1705963117789;
        Mon, 22 Jan 2024 14:38:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFKwwS9qaywjZeX13lqLHKwLGkjf6Lj30G70HSph11PaDETHfEPqYly1VbL3iFzzIP3Dse9w==
X-Received: by 2002:a05:6000:71a:b0:339:23b3:124c with SMTP id bs26-20020a056000071a00b0033923b3124cmr3058597wrb.135.1705963117482;
        Mon, 22 Jan 2024 14:38:37 -0800 (PST)
Received: from cassiopeiae ([2a02:810d:4b3f:ee94:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id s17-20020a5d4251000000b00337d84efaf7sm10959936wrr.74.2024.01.22.14.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:38:37 -0800 (PST)
Date: Mon, 22 Jan 2024 23:38:34 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@samsung.com,
	aliceryhl@google.com, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: str: add to_ascii_{upper,lower}case() to CString
Message-ID: <Za7uampZiG2IP8dE@cassiopeiae>
References: <20240122184608.11863-1-dakr@redhat.com>
 <2024012252-attempt-tables-e3fc@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024012252-attempt-tables-e3fc@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 22, 2024 at 11:35:29AM -0800, Greg KH wrote:
> On Mon, Jan 22, 2024 at 07:45:57PM +0100, Danilo Krummrich wrote:
> > Add functions to convert a CString to upper- / lowercase assuming all
> > characters are ASCII encoded.
> > 
> > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > ---
> >  rust/kernel/str.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> > index 7d848b83add4..d21151d89861 100644
> > --- a/rust/kernel/str.rs
> > +++ b/rust/kernel/str.rs
> > @@ -581,6 +581,16 @@ pub fn try_from_fmt(args: fmt::Arguments<'_>) -> Result<Self, Error> {
> >          // exist in the buffer.
> >          Ok(Self { buf })
> >      }
> > +
> > +    /// Converts the whole CString to lowercase.
> > +    pub fn to_ascii_lowercase(&mut self) {
> > +        self.buf.make_ascii_lowercase();
> > +    }
> > +
> > +    /// Converts the whole CString to uppercase.
> > +    pub fn to_ascii_uppercase(&mut self) {
> > +        self.buf.make_ascii_uppercase();
> > +    }
> 
> How are you handling locales?

For ASCII only? Not at all, I guess.

However, std::slice::make_ascii_{lower,upper]case() doesn't seem to handle the
extended range, which tolower() / toupper(), according to _ctype[], does. Do
you mean that?

- Danilo

> 
> thanks,
> 
> greg k-h
> 

