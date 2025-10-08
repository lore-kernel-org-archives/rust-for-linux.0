Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7986E2BE652
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759941511; cv=none; b=l/cuI0fxx8tCeJ46BI2zisGqRHTMy0IT1pPdMYWR30kixvx+RoXjOBcHbnwlFVKQ5IWQmiXMJnZ/IQDGSuTv0CiHlLT5O8CcwK1xEMkm/KGwhP9POpC5VacGYmKjlkQvDJsm2houXtESQWhvJg+tVTyEPECMZ9hLQZCBFVKe9P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759941511; c=relaxed/simple;
	bh=GHWooLMWFQpFYOeVJKbxAuT3hNdbnsUChPxjCEbkMIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RiNgKaBlmqoAnhwu1E1SpL/nN+6Uk+xrIRfLsDacuUk08z5ibM+sLswM3/unTTSIpTZUOZNdeld6Bsk+WwcXwyd64t6w+JvPOzE73mzTylFlkHYGPWegES0xVrrKAZNiiwMXkf9s3srwHj12HFvV50quC458tS1f5O/EpUNjesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OPIIeUxw; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OPIIeUxw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-27eeafd4882so4425ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759941510; x=1760546310; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZhHoNM7BdTnfoFMXEJIgA+2SvIY1LJRe/Bxo4/DQQok=;
        b=OPIIeUxw4mi2buEin3WKqZQE4zTUkA39VWft/En3nirwYjmreoyyLxwe7rPu7BhgPa
         BCqJyeOwGH9CvuH476rnnq135bYokIkInhnSseqklmKGvT4BWrSPZpCVcmqIf4Mvql7g
         +B9FpXbUiW0y7+GeydzwN/cRTkg5xyObrbbqwqaIUsZ7znzahgH0cbpUPn7LG2Mco3UU
         7sMqJSCIDSwNLsWLRGhXK3bd4su/iUjinEYroByAUguzc2d6H5BP5MhPjt0bG7lNLDhQ
         u5ZUKq74sSeq81/iSPgDPLmavPC8ZjIs3sL8qnoMSqm+1Wy28DIYhs2rFS6q0ajehgfs
         DktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759941510; x=1760546310;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhHoNM7BdTnfoFMXEJIgA+2SvIY1LJRe/Bxo4/DQQok=;
        b=QcqJp4ZHnytCaWgCvIQ6q3SK9usrFwc1todmAVGNjJlPDwPqRBXxKwaX+1XHOteXKk
         A9nsFJm9cMU+pw15dt3iwUSkkqjdtshVe9prGyHsLq63Oj5CqXF6bE5zbiyhHP6YTKPj
         11sbb32cuSqHZqdfucGf6kGbB+SCKqc8xzkv5+b5ovx+6O9mBBHE7L/g9CZIWwZ9cTcz
         kEpbafTjAL2oWLBJWnyuSRvGDdKLqcepiBIK9Hqtw2LXxfD2Wb31W6Fh01bbH2O3VY2g
         ZgAckmNMb7L8osIJHCUyOFms7j9r8LAF+F68iTQ7R1JfUTJ8732g9dE2byOAW8oRDyLZ
         /Ymw==
X-Forwarded-Encrypted: i=1; AJvYcCXZlHk0y6k9bmzpmYePoVyA+4zDVmwwXBcD6/RkPmdphcsJSu+SFTxlgibUEtkB9VLW1oCEjxXxX4sbvLA5JA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Bm1a9zFxwmlB3P+4CXiL84OksziMXWXZsCiXINDnV3HFgWo8
	8aPe/ffAXhlFsyUzU7xF2ZczZTjDGVGcSmHmxpfxiJsbl2iVHABn8HzxYXZH1ctm3g==
X-Gm-Gg: ASbGncug4cP09P4qgtbIjnGzWAT6tcQpwiB1WucAdG5D2IqC8WHlqLHyjNUwJ0cXVSu
	SHPe5lkq3rVFLbjxwZJUo1TA5apWvImgAPEEcbxzsEQMbRqhcodaOML/0F1tm6gU49CWXHOaStL
	xedITTZOrQIhkHLVPGWGnB7qxyT4NelOYZD7k7zLTZ413GQQSI5zPVBlZNCPIC2Zwr3PrGGlUtW
	jgzlN4X2FMVq/m8VDkxLmzilDqQaFqz1e/fyk6Qk2PVvi+XZAZg6RAInatKzfSduPalZ0ybDPBp
	XkBmI1RMG3jm7SNvBM5AccdVgYdH4LV0jyWmwILAIRQpzfb26iU7Ak7WzkysCCtDpoAdxqNp5QL
	+esb/eO4OxIK5d/saSL5ALTEgi5mibjdVl9WNbfTcHJ8krE80Q+zVeIsuk6s7JoO46PQsKiZJwQ
	gaonCK9a+Wmhu5GEWkGdcQTROrbbdiHWsvtJEEqR10s3OkbhA0QZaI4Ys9YXHln/XuayB2oedyj
	9rALumVKWzZ
X-Google-Smtp-Source: AGHT+IGRDpEomZWgPBqyU9u790g+kBQTaK6pVB3TmsXBhOElsAAwmoOekWMwKi8oOPtX/rPh4gpKPA==
X-Received: by 2002:a17:902:f787:b0:269:ab6b:5bba with SMTP id d9443c01a7336-290276f92cfmr5965515ad.17.1759941509214;
        Wed, 08 Oct 2025 09:38:29 -0700 (PDT)
Received: from google.com (235.215.125.34.bc.googleusercontent.com. [34.125.215.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794d4a431a8sm215408b3a.9.2025.10.08.09.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:38:28 -0700 (PDT)
Date: Wed, 8 Oct 2025 16:38:24 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/3] rust_binder: freeze_notif_done should resend if
 wrong state
Message-ID: <aOaTgDMY-VvM_r6m@google.com>
References: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
 <20251007-binder-freeze-v2-1-5376bd64fb59@google.com>
 <aOaSA0dPnY2I4a_D@google.com>
 <CAH5fLgiChj29SbwN-5vHhCNzaUa7wewOXe1D8mN3XFfyZr33gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiChj29SbwN-5vHhCNzaUa7wewOXe1D8mN3XFfyZr33gw@mail.gmail.com>

On Wed, Oct 08, 2025 at 06:34:54PM +0200, Alice Ryhl wrote:
> On Wed, Oct 8, 2025 at 6:32 PM Carlos Llamas <cmllamas@google.com> wrote:
> >
> > On Tue, Oct 07, 2025 at 09:39:51AM +0000, Alice Ryhl wrote:
> > > Consider the following scenario:
> > > 1. A freeze notification is delivered to thread 1.
> > > 2. The process becomes frozen or unfrozen.
> > > 3. The message for step 2 is delivered to thread 2 and ignored because
> > >    there is already a pending notification from step 1.
> > > 4. Thread 1 acknowledges the notification from step 1.
> > > In this case, step 4 should ensure that the message ignored in step 3 is
> > > resent as it can now be delivered.
> >
> > hmmm, I wonder what happens with 3 threads involved where the state goes
> > back to the (unconsumed) initial freeze notification. Userspace will
> > probably see two separate notifications of the same state?
> 
> The way I implemented it, the work items report the current state when
> the work item is *executed*, and they do nothing if there's no change
> since last notification.

Oh I see, then that means the 2nd and 3rd notifications would do nothing
as the state went back to the last notification, correct?
