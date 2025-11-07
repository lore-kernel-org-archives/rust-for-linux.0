Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BF331197C
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Nov 2025 22:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762552873; cv=none; b=rZ/VYMnwJSxUQZhdzM4hptuw85fmtI7+l1XycfIS2pvUge8JzSG0UwUOUaAPaZxKob/7Rf2vxs+eWtv5vU7ghPyTn6iBr1gGXAAMJxcxKYcBolp15GilNCLE8h4MB0FvN2d7p17bzifZXxoVJfbU+jELxAMMjH7ob24CSaxFlyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762552873; c=relaxed/simple;
	bh=NqCuPJtIpK/hHf4UiY9mtn9CsFUO+7oKJtTquFAaGEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnRWil4viAHz3pK9wzmUuubiDnoVBDITCW8dlyKlYsgW4xA7dd22dirGbTH2tIhrD+cGigfB6rR6xdSz9J8MCJFfcqw0Brktr+74nFpy3X9yC8ews2dJQjcgVf7qAWFKEbIlptBlxaEZ0HM0SpUzf+w/ixNAE/vG+J90wAlAnE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B44agV4L; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B44agV4L"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297e13bf404so46925ad.0
        for <rust-for-linux@vger.kernel.org>; Fri, 07 Nov 2025 14:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762552871; x=1763157671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lO62eF2nnq9lumozTZgKwjImCeW30ulMzrcNDCSM+l0=;
        b=B44agV4LXKaA7i2ZZS0O4YQKbDMddd11lham9xTMCLFJRN/MXqEx7OPKna6Hayma58
         OACLn+Dj17Mdb1Ll/Lr9Jl8uLSh2J6wgN0+Q4srLECuEdX46s6HoWd92z/navgZF8jk2
         KEcxRb0rXI6U201tFCFSzlHU/JlrSEeeb9127jyHWd4XbpNcjwx5A+IqKD36e+Zy5Sqd
         JQt8+4XzXAfa+SmL+c+0e4AGoQbqt2+dqSnXGZ3n6hvMHA9Uk/emVljHdvxqtLawNej8
         sgcaGgfnUTL6ivIpAK9CgR+szi/hy/ZWJVToqdfhHHzH1FF56ElPKHKuBkPHfefw1J5d
         XDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762552871; x=1763157671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lO62eF2nnq9lumozTZgKwjImCeW30ulMzrcNDCSM+l0=;
        b=jPhJrCWyvwTOoFUwJ7TyLBtly1S+1nZ6b9QbafiaBI6Fom9A03bK9iLKfD6ROfEFLX
         cvMY7MG/euDBL3omRxl5e6APK4XmzkhXdZ0dp1iQFj+7znnPQ0EOtFLKtMDFi7bNLhQ7
         TNpAjMYZVAG5hiC6eQbxhubc11PRbuMvB8RuYKxxpLJ4LGB+9ol35soAHmt1RvB/eda+
         KVqDOl2jWuOHurCqwx9WRQ52yOPMaAJDGV+Hr/H29y6JtowMOzNoQaN6GRXO9k53k448
         4jao4CtK0aFi7BtrtG98ZjuXNpOO0XTMWMuOaKsMRA0dwOzwkb0PYfQRaiyrZaP9SS1y
         Qggg==
X-Forwarded-Encrypted: i=1; AJvYcCVslFdDmHEkALSrfT16OgrSZcpMiCFpLRbfvDs3U5ARAksgIUq3g+csesS+jHFbJ8Q/xh7X8pML2O1dth5j7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Q8My6ljbTVBv18GZUppFpvtvY/jO5/alFNwZJtJsvNzxoneh
	FlMUVocjr3Tv561erGoAPNjw0pWsNSsmEB1FeulDSDmqvLy7mfnuK94U1eNQ0Hy/sg==
X-Gm-Gg: ASbGnctpyZz4CNGSvpx1I+KsQeRmab06oQJFWhaCSxIa/a2ttk675r/AM86l2Ybb5dm
	zm8hbZe3qKniN5G5Ch7gViXqyHD+8HA7ybAm5QdFD4vq11W1eRsQSupmvZSrItbUhQ7GKpagq7C
	ph+DFH25/7Sy/v2rJ3eF3C2oxSgRRwM2u2mryp0CnwLDtkszUr+23oMz2QhYexdiPXhxEyPHTlY
	aUkFQ0VX4a96knKdIXCU+AO2b0pmlWbMX5G3a6RViVzXCYsfb8b7/Tf/VeTaocchfnOYO5QKYUP
	DsHGEGH4+9h47nSwR1sVcN68sLTVxYaJGwGWEfUOJ7Er7hiVyL80RqwLDgsyKJSfTp+Yv+G3A5p
	ryDgrwyTV2SP/F1mO7Ayff6iyhtuzU0IzRtWBu8bHRG8srEhQ1sXHjtAoS2HAAx3iaDEyrLJVba
	a/k8L+JuSsVEKNB+DPdiveoPOn+TfaiWnCC9iSC4Z9mHktHJw8xV18OE0HXOXDLZ+BNb0MbYZCk
	J5jzUfXw3/LfVp61Skk7ezZjQ2sTj3ygFW+
X-Google-Smtp-Source: AGHT+IEGlO5C4EI+b+m9m+aIDpLZfikk77tRfPm4g2La1C5BkEIgfoA2g0ZMFA/yrbv7f4GjcaMfvA==
X-Received: by 2002:a17:903:2f8f:b0:293:2a8:3f9b with SMTP id d9443c01a7336-297e7e3d68dmr264545ad.15.1762552871000;
        Fri, 07 Nov 2025 14:01:11 -0800 (PST)
Received: from google.com (116.241.118.34.bc.googleusercontent.com. [34.118.241.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ca1e718asm3886512b3a.30.2025.11.07.14.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 14:01:09 -0800 (PST)
Date: Fri, 7 Nov 2025 22:01:04 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust_binder: use compat_ptr_ioctl
Message-ID: <aQ5sIOHQ58CX3aQJ@google.com>
References: <20251031-binder-compatptrioctl-v2-1-3d05b5cc058e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031-binder-compatptrioctl-v2-1-3d05b5cc058e@google.com>

On Fri, Oct 31, 2025 at 08:48:18AM +0000, Alice Ryhl wrote:
> Binder always treats the ioctl argument as a pointer. In this scenario,
> the idiomatic way to implement compat_ioctl is to use compat_ptr_ioctl.
> Thus update Rust Binder to do that.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

LGTM,

Acked-by: Carlos Llamas <cmllamas@google.com>
