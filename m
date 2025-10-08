Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4AC34BA37
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759942381; cv=none; b=NPtwdKLgoGpOVNDIsw1UF6xusmpa1M3tQaNNC888arvi9aCI0sWRvA1zVmzP1+GFsymNaV0EOtaxi3qMGw50P29eCiEPSy6Bced41s8WVl/jW6RbS3HGOjV+vFyJU2EIh4AaZBWnVUN662uG8gfL4M3Pu5W1n+T0wWMbZSllChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759942381; c=relaxed/simple;
	bh=Cdk/aO6tvlVhTXsrhkMkGMbUJJ5f1Z/oxjXW1lCVoNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzYYkxXv62pda4m4guSKNVTI0EOFSkRQb3vrw5QsiSAVwm677u23D2IvQ07GFYiig9sWBMYlhoFMbcM6L8F9cr/EAP2vVQPztM6ai60HTSXbiuqz7ClTO6ZAUpCmoUzmG6o754IRCP+UJdQdX2hsszng083YwxPq+/1CNKpnSEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WpXuJgJN; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WpXuJgJN"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27d67abd215so6165ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759942379; x=1760547179; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9EYeVWKaJLduXJ1zMxIN+V+sOd/pgipLt8fA/AHC3Rs=;
        b=WpXuJgJNhFxZEfHytsC5VXISlsJ2pdwIgosJZ8kZELide//0nbRS/8tlNq+gSXunMV
         4HXImnh6tdmR9FOA/oAa9xkjG9rU/Zw3/zAfJZIGIDFVR28qb0cbvY1NZAmU9Rr3z0ME
         NvudjCLuCpOyj/JyihaI2YSn7Qxy05k/zdRU/Lt73eHoSlQjEbawbSK6WZFjZ7vBJvLm
         r9lCqE8wTrSUzrBmX5Db1knklxe1QhP37B7VxdEyk9z5XHEDS7e9q0cCNXghQt/eiSRe
         +HuQ1rA5+5tH16mbAmEXbx4/eP13YHWzd1nRHSqKgb/jdJsnEkYVRM0UjPvoA9FpfC8Z
         gZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942379; x=1760547179;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9EYeVWKaJLduXJ1zMxIN+V+sOd/pgipLt8fA/AHC3Rs=;
        b=PQo99pJrEapXXW1P7bdX3BCwngILOMdbTb77e6gF2WjEJrRvSAyfUdyjJbLbFPvmNa
         RT3my++sqv1V3V/ua8ZN3HRq3vuh5DNFW/v/82xtP6NgJ2cT7RCu1+TQrY6qlDGw7xAg
         wEC+vzpaMQbZ7TbNj3u81Uwc3YJFes+g9Hglb/R3s+MDrmdvy5xfqdSND6leKODy2hkH
         Y5q7AAGbzdbDeg+Hq5jPeE8RdlME863n3Sr9tCdpm5d7C0KTXnPWeTyhC4+zgCYsP2Zg
         MENc7xbdD28Dm3vu0HWxoty9Qb8ir1Zgw6K/rzFjVgdPSre0mUIhJ9q96ADw1tsQgTc3
         9OQA==
X-Forwarded-Encrypted: i=1; AJvYcCUyMNz3NpuuG4hOnYjFHr4ArGz/Q6p8nlh5j7BM7dkuLroHHvvixHJsAa37IY4JbbYdpQgcg473dNpVX4VMPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnnUt+zF+Irfx9AlGW2V3fFm9D/i+Ao2XX0vkviwSHnZF1qSb
	3+6KuAsDCXw4Hx18rLMYX1gb6K4tG3F+DNDuVhRZ5YhHYj4ROUn+0bhnVP4CX6WBrw==
X-Gm-Gg: ASbGncudsku17YaX+Jlby5at954+H5Is3IkKCeCp677BVLiZ0dhL5jbnnZz7Uewf7Ms
	LEhI2XSkZHyAIzpPBpGj1nsnnQJGvkhL0gBNEORoDLPoU/8+lOZ1W1G0bwoBrvNssLoJN5i/lGa
	pCXMLyO1VLyeuj5x0KHlAWvCkmLJjn/u9NforgRhDO7jfG0IY3ITufCZuKo3aDbQz3xYZDLZwKT
	3fkotOv9Peyolw6GtEHL9/VxstUFkWAXUIXtvLvNp9QDJzW+yDqmafa7n00tpT5SWI+5KOm3oYd
	95ENuNMvlhBucY/ARv+Yz+2UZNxYd5EXRp5c+BtoryJLSWrtvOsLFBWtvRChBtq5GG876AMcr5o
	lDZvdziRsot8Q3wphfcJagXGgLcFB1OGBTSsYkUvVJyUe+3Gh8zkmb5gU6hkD+gLNUw2Tm8s1km
	9hSaXk+dho3xybnxXTesGSGV/rbLs73ki6rZtuJ8nRsUdzruOw7U3ioBOGvyeDafn6CVXirMB2m
	g==
X-Google-Smtp-Source: AGHT+IHzTEcwMHKZKFietSiNe1qUQn1vA6hRSbT6ZocFw4Y26Trifqiyl9kKxaDDNqG25VyOHaKKZQ==
X-Received: by 2002:a17:902:ecd2:b0:26e:ac44:3b44 with SMTP id d9443c01a7336-2902768e4c9mr6564885ad.10.1759942379209;
        Wed, 08 Oct 2025 09:52:59 -0700 (PDT)
Received: from google.com (235.215.125.34.bc.googleusercontent.com. [34.125.215.235])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b62e121e0afsm15752127a12.25.2025.10.08.09.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:52:58 -0700 (PDT)
Date: Wed, 8 Oct 2025 16:52:54 +0000
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
Message-ID: <aOaW5s30sRc6gPnA@google.com>
References: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
 <20251007-binder-freeze-v2-1-5376bd64fb59@google.com>
 <aOaSA0dPnY2I4a_D@google.com>
 <CAH5fLgiChj29SbwN-5vHhCNzaUa7wewOXe1D8mN3XFfyZr33gw@mail.gmail.com>
 <aOaTgDMY-VvM_r6m@google.com>
 <CAH5fLgha8DdiZ=XyyNRx8Y+GS6SCO2DHF4qMgKwMoq8tUXc3LQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgha8DdiZ=XyyNRx8Y+GS6SCO2DHF4qMgKwMoq8tUXc3LQ@mail.gmail.com>

On Wed, Oct 08, 2025 at 06:41:20PM +0200, Alice Ryhl wrote:
> On Wed, Oct 8, 2025 at 6:38 PM Carlos Llamas <cmllamas@google.com> wrote:
> >
> > On Wed, Oct 08, 2025 at 06:34:54PM +0200, Alice Ryhl wrote:
> > > On Wed, Oct 8, 2025 at 6:32 PM Carlos Llamas <cmllamas@google.com> wrote:
> > > >
> > > > On Tue, Oct 07, 2025 at 09:39:51AM +0000, Alice Ryhl wrote:
> > > > > Consider the following scenario:
> > > > > 1. A freeze notification is delivered to thread 1.
> > > > > 2. The process becomes frozen or unfrozen.
> > > > > 3. The message for step 2 is delivered to thread 2 and ignored because
> > > > >    there is already a pending notification from step 1.
> > > > > 4. Thread 1 acknowledges the notification from step 1.
> > > > > In this case, step 4 should ensure that the message ignored in step 3 is
> > > > > resent as it can now be delivered.
> > > >
> > > > hmmm, I wonder what happens with 3 threads involved where the state goes
> > > > back to the (unconsumed) initial freeze notification. Userspace will
> > > > probably see two separate notifications of the same state?
> > >
> > > The way I implemented it, the work items report the current state when
> > > the work item is *executed*, and they do nothing if there's no change
> > > since last notification.
> >
> > Oh I see, then that means the 2nd and 3rd notifications would do nothing
> > as the state went back to the last notification, correct?
> 
> Yeah.
> 
> If the state flips quickly, userspace might not get told about that if
> it's too slow to receive the update, but that's no different from C
> Binder.

I believe the difference is C binder doesn't report the current state at
the time of consuming the notification. So I'm thinking that it would
report two notifications regardless of the state, even if they are both
the same. Oh well.

Thanks,
Carlos Llamas
