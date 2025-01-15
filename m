Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A92E23F28F
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 08:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736929996; cv=none; b=WktzP0spX1cDQYGEvemSV7Ja5CDwK/zZmCMwRI9CvbvuQq8yqZK8nii5x17scXsmJHfjMCATx9xrTpYoao6usSAcG2kJhxEg9oSiNRqfJDVD+ovsF7whhTsD0L2VcJwMZ/lFKiCxwhE9J6u6om4h8S/BvBBAR3X1q8J5RPfL6Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736929996; c=relaxed/simple;
	bh=cw3S++vdVXpH+g/tLk5BUZ01m6F3t/o8NvHQI8NxdH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phmmJI10gn3YqsW1RzrF+2+Xw1i016SoqHYOnb1oOqK28WJGcKdRKJEC3m3Y2DWbAXCku1t0ZcwQOkAPxDBooeBmj5uBsnduLZPYgUEuStA5hqSxPK4LpVjAqUkfHenDhIqpvuUZcuwfz5nga4I5HU0ZSoqOEE/4tJsEZ3dhC1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wJLMNqTe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wJLMNqTe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21bc1512a63so50698275ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 00:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736929994; x=1737534794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWWfS7tapqV8kF0uj38k4QfSVdB4DqWDSsuce2QnXMM=;
        b=wJLMNqTeTb9PGQH93NVpunUhNWOLlQz0YoDhLDn0QaSD+S+ftS/muyrqkPmeQwjW8K
         5Nqgxv+6eV9hQ5zJA3hpywgzF7ySMrw1BtDZ3pDKMpl/izZx69h1oBb8NDyL9PbkZ/Xx
         femVD8bRRycjUxTVOun83dmrtcU2/zZtYZcCtajihH85co9xrMIRCAbcQ3VHJ95D7SK6
         U7ohaXEmRh5XoOUWxyJfzlfUNA2FweaxjyDiFgMG/ANTU8vpT3mDnI415bj26Ox11OJR
         5S6vuIHEZKPuqNq0UyPz/W4s5457oStsfE7dqbrq5yQl8yT+8mxxEeUzFrNZbsPdvG83
         +Esw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736929994; x=1737534794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWWfS7tapqV8kF0uj38k4QfSVdB4DqWDSsuce2QnXMM=;
        b=JomeM5H9SJJi40/MejhTmN5VhOAmornR5wv4W0RW4SfzZe57kj0wAlQ3Iz0+jHWzFR
         H4NSSJpwBqzppqLRKe4lxOhZwFSFotSBfkqunw7xev+d3dX1EhN+rc94E9nsbNKxQPuH
         Qt8975zBWpkVOXQ4mC/bvp0t5zQnAB/fE1EP40e1vhDlTUkNhSAQsmFLu4lRyJgH4/q+
         n4H8JNlM1uIrctyGfunxxBLPkq3oQv1C3oB/pk6MHHN8NbtGCdbvakotiMe8uzQWkQSa
         qFDMS0iTjoKVNcLpZxnotOUmNEbgOc0PwlMFn7DCZns8z3cFcza3Kk3/JTL//B6tqmis
         UGPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/L9hrnKHrxrIsTf1YhLa43w9kWT38DuADS3d1h7Mi+XLD7kYoLg96hFx+9PDvh8DuVhTytwudNVrE1HH/Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRnYVBFz8PRGj5pAmXE9GFw83MZXgXqaWvIq/P3RTi4YUJR45L
	ayl/lTKpFeraJdNb8voDTzLqBeKubUdOczDMqHGQ+iWIZDq1lxbRbgnZl8OrZlf0bnt1FLZDvK3
	f
X-Gm-Gg: ASbGncu8roz0e4wZ+14G2F9x2wH0nRCiXgISH4hB7q0qhIYdHkHnih6r1afuwaLW5oK
	yhAMouidwaAJEekZhGy0evq3ltJFgUWGJvBET32/vdonUz2KkoXubkAG/Aw0Vbn+RSPnQbSPtRI
	+LQyrFpUUPQ49AjH1b9BjJD4IlbYhKLkeLqKJc2dSQ0qIqkmNHWbyGMadbhq8kHTzwTJr40e5Px
	aO172ivvAGldGiI/5oWBJrtZ7Megzqbem+RJsQpcreoByuamDhiABee9EU=
X-Google-Smtp-Source: AGHT+IEn4mDyp27eGh/C7ybZ+N86WAMwiQGXdJoC6yy6Yg3Vd+MXpgipNrkIRU+8bfpEthVENfvTmg==
X-Received: by 2002:a05:6a00:35c7:b0:725:ef4d:c1bd with SMTP id d2e1a72fcca58-72d21fcec0fmr44185163b3a.19.1736929994413;
        Wed, 15 Jan 2025 00:33:14 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40658a7esm8903334b3a.106.2025.01.15.00.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 00:33:13 -0800 (PST)
Date: Wed, 15 Jan 2025 14:03:11 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH V7 03/16] rust: cpu: Add from_cpu()
Message-ID: <20250115083311.lgw2eu7hz43p2olu@vireshk-i7>
References: <cover.1736766672.git.viresh.kumar@linaro.org>
 <854f7b8c9cbcc7f38fe5ed548290f41224478b40.1736766672.git.viresh.kumar@linaro.org>
 <2025011430-humiliate-expansive-2ea4@gregkh>
 <20250115072050.72oeibi735k3pjdq@vireshk-i7>
 <2025011537-shuffling-unpaved-121a@gregkh>
 <CAH5fLghwAQsriWru-hFs+4pcvmpzZRj7GNC190RL7vi6p9J7Mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLghwAQsriWru-hFs+4pcvmpzZRj7GNC190RL7vi6p9J7Mg@mail.gmail.com>

On 15-01-25, 09:10, Alice Ryhl wrote:
> On the C side, how do you normally prevent uses of the device after it
> became invalid?

IIUC, the per-cpu variable (cpu_sys_devices) that stores the pointers
to CPU devices is cleared and later calls to get_cpu_device() returns
NULL.

The hot-unplug notifiers are fired for existing users (which have
registered for the notifier, like cpufreq), wherein they can remove
per-cpu sysfs files for example.

But otherwise there is no way in the C code to disallow users of the
CPU device pointer, if it is already fetched before the CPU is
removed. The device pointer's memory doesn't get free here though and
it works.

-- 
viresh
