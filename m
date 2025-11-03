Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CD830FC36
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Nov 2025 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762179968; cv=none; b=W7UZ2JGnpAoNKyKhPj/8oHwy1splYd8nU49jOTfdwnIDjVewYvzRxaqNOiT46mssyHInoEa8RPodxmOthVDj1Ual4wRbB7SgofsGDAqPLdw+ayVEDXiemRz+phHBbJU4TWEulHmQakYlP7Rzb+VCiJDjSFcCJJz6vRytvlZR9EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762179968; c=relaxed/simple;
	bh=K78RWkk+rgbWnehNDeAYSAUzgd9AWm27AyEpeGRwU2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKAFWYao3m10o0BO09klfzt1o8/OQESxUIolYXW30d2AOcZv5pALa7a6RSWWZZWrNzegFlqS/OtYyIgYeKLRtVoywomF2uZ75ZuRZWoJZ/7yMbSCYRvqQQtenEMOFUeJtdoG39aqfcOTnwgvY9HPPP4cU6rEaza/ZGR+pnK0VS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPXnjccZ; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPXnjccZ"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-73b4e3d0756so61142637b3.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Nov 2025 06:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762179966; x=1762784766; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5vG+TpX2vimjAShLENqDDN7PpdggEkGS6lF5Y2WIW1Y=;
        b=CPXnjccZOaBIKhfIVMSv68iYEaUZULispLeGTJ06a7jJtMD4dRM078/ZueAC4JLP8j
         SbEf/aASwqwz735LpihdL72POBPG5AirLdyfgBP/2wzuZudCsuef7OmDE+XWvoF51PhY
         6dgNum+hyOX1f4Q/i9Q6533t+KfN/qw+wWWpzJVVaepkEL0+zYgGJayeKa60W8EhC8sx
         BJdSVXspMK6ioPiFwQVrzvwuLHvIpLybEFeWfaSbVLwt3oJ/NpSNLC7pbcoctFXjUqCV
         7EWhcw+RTAI+4z93K29PNSRr12ImKNQi0RKIJD2zusHgf5BMRNQc0q7Gt+aYCBHKV6fl
         v2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762179966; x=1762784766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vG+TpX2vimjAShLENqDDN7PpdggEkGS6lF5Y2WIW1Y=;
        b=pZ+Q6YFGmiyofZKKZK3cQrZtKXTdd5hGUFnvHh2T85HWiElWP2aL/8zWeE9Tv2JnvQ
         b8X+2JUGdQYrX4Bl1yNx5aVhxb+4EfbJhaEJj8X3JIc7yxZNKHk/Fj3XzeLUjF37U/+6
         JjyyJq6Fmedj2LSg6MfxnVuOewjSZBBXEhLmzor/JLgv2YRepBAm49vMPHvZKGSVUGdd
         RC1pVmef6Ne8Y1zFFwJ50SzYR4eJh8UlSvbeyX6f372meAXi6JYNCbkQotciGleA5kMz
         6TkpR2JYBeqz/+VArzRrnlqTPr9bw+VO7bq+EoFIzS40znAk1S06sTS9poYSw6YJSKYl
         ISlg==
X-Forwarded-Encrypted: i=1; AJvYcCWlEhlQ5MFaisqLsX2StsxLRcSX/WqAEwVyczuzCkujBDEpMD63Es9roWgqGarYuSezLSVNfNSHTyaaeOfBDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe095zaiPLh+R83n5tgf5Fx83nKm0gF9Yp5YSZ7TyqGUOZOIuj
	L/CPULBDmPEeo0QhyyQK5DuRkb7KyBKdlaXZgrBEv957lvzHcXvu8hNubOLjqQ==
X-Gm-Gg: ASbGnctiz4x8zaOFNwCZ12stNXibnTUMHBMiF4Y8YugC9IhORTcsZIwj1krkOCdwe5R
	xnhTYHnV+cVrIU8pO3fDUAen2tVvvFCugpA5ZvfVHM6Jqj1MjQbO6dV9S4Wt08yWre9zQ9AYYzH
	WYOPi3IwtaJILY3zq/h+0NCybc9WJusxvyv36qVXsj11cS4iXe1hDQ0Uf40X9iSLdEaddXYoKSn
	B4JUEzH0foXlcTUuENk6AZGg2Rjvc00pOBjzKe5SuW2ahqXc8/3R4N2wobEDipZYVbq2B9QP8nG
	va5xlbpx7sI9sic9ET4sJbmE202Go0JSQj3DDYXxQgUvV+HZL134CKx3rX05V2l/SOq2F6NIQ4M
	XyjkVytIE6a6Ufly+7RyCtUURRQy8dG9BukcvKX1l61UNnabeh3xO/e3Xf5SXLdE9DcYR3sYsAB
	FOpXRhAXMHLXAA7SJJ2JDG//KSzKrIgnLvT0jQmbYTuyc=
X-Google-Smtp-Source: AGHT+IEH5jdLQbZho/a8RA7nF6g94W7FdJWsuNNVwBRPPoQkHp3BskZSgwf/LVFOw8f9zQEGt8nKaQ==
X-Received: by 2002:a05:690c:4b88:b0:786:59d3:49da with SMTP id 00721157ae682-78659d36da7mr83652737b3.22.1762179966040;
        Mon, 03 Nov 2025 06:26:06 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78691d8f62dsm1071397b3.10.2025.11.03.06.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 06:26:05 -0800 (PST)
Date: Mon, 3 Nov 2025 09:26:03 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Jesung Yang <y.j3ms.n@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: add BitInt integer wrapping type
Message-ID: <aQi7e6VgFsqpq1Rn@yury>
References: <20251031-bounded_ints-v1-0-e2dbcd8fda71@nvidia.com>
 <20251031-bounded_ints-v1-1-e2dbcd8fda71@nvidia.com>
 <aQgQv6F0Ao4DH6U0@yury>
 <CANiq72mg-NntJLf_jbigz++0hK7G3WAxbvejRq1EzOc7GE+doA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mg-NntJLf_jbigz++0hK7G3WAxbvejRq1EzOc7GE+doA@mail.gmail.com>

On Mon, Nov 03, 2025 at 03:10:01PM +0100, Miguel Ojeda wrote:
> On Mon, Nov 3, 2025 at 3:17 AM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > Rust _must_ do the same thing to at least be arithmetically
> > compatible to the big brother.
> 
> No, Rust doesn't need to do anything of the sort, sorry.
> 
> The point here is not to copy what C does, but to improve on it.
> 
> In particular, we definitely do not want to have anything like integer
> promotions and arithmetic conversions from C.

This is exactly what the patch does:

  +/// let v = BitInt::<u8, 4>::from_expr(15);
  +///
  +/// // Common operations are supported against the backing type.
  +/// assert_eq!(v + 5, 20);
  +/// assert_eq!(v / 3, 5);
