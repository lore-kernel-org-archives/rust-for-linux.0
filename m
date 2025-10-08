Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736FA25FA2D
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Oct 2025 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759942439; cv=none; b=Cygm4fp4tM+KT4En56mUWFOLwZ9FP84eEljnPpze5m+Kmk1XMnriNMUmy0V6hn/p/tVoqBS5J8AaHr+TgokJq1RIpLLVydZJVaYiwce4y3zKB71TsGSKvau6VyqAZW94rek/nesMHTu9frDhPmoCARplrK6c92mgZY3ZrbhA+FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759942439; c=relaxed/simple;
	bh=jsdDoDNG7qC8k729T1BbWctZo4QpNIT4HRQNrvjqvb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCnYeCEtps5UwWx6Jz9Ks9DXEp5aD/ESbXtQrmSzjZSmO43ovS43+qyVczd9wvQeEzXaPFIZRCW+fWR2/nphMhrs2+ZhrQm2GOK2cEI0YCJH8s9izziCurIYQsfnQOkgJvJboHKl/goYw9xNdAV+YFrACK35Sf5j7ZkUxApzjuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o5glQCaI; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o5glQCaI"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2731ff54949so675ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Oct 2025 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759942438; x=1760547238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc8rX32dX1hioJjgjcjbwMHUmlxFF9DAwOuIRqiY3NI=;
        b=o5glQCaIdrHkqojsewGGYLZh1dteZYOGnDa4ht1p7xaxqPL8esl4Jnuiqojo+udsRP
         742JeqpVmC8cElZh2R70vxh2tAL/gDWIknOfsRaFdXwmeq91XSoVd7F5PE3YWRoT6/Xp
         JtdOsrJzdiCUgBqdQ3SHN/koNhQO3mbZD/pAcAKV7DdGn5o/UFSIGgvUCwpTqdb2NqkC
         LZJstY77hKQYy+dR7vIvpFl+csIIeKMtxxQJZ/VS/DLVNCTQTCMgOCyCiA4BR4/hHg9V
         FQolQcsI2RRARD5qRbi6Ji9oINY8AzAVoccP9v5dzY02pnYf7bqkssdZDlTyCZJOevZs
         +JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942438; x=1760547238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tc8rX32dX1hioJjgjcjbwMHUmlxFF9DAwOuIRqiY3NI=;
        b=VTBZky90qt6CpzMYUcN03OnxARsaaOT/EDast81u283NatWU+23bEaadq/uD7fN0JE
         EjVWK9f1mmpfwtqMeYdhxIAio3NNE27aONaJRM9mi1FintYzCF3z69JbnBrORpUZ/280
         MDSWouCZZH9ZIuIZaypOZWmfdvw0ejaul+EApEIew+7n+p6WJD69mftJod1k59XJJydP
         5SNtje0LJoBFkKO9gJsp6QCPRe3+snhQTqcM3qWC+PPr9PRmhYiBnuBVu+A4Cs3GLkia
         RbSn4h31ZTZUN0gKZk8mrAowaJrYYbv832NrVRkuRafc7L9v1E93szqrmt6jzDM2Cj8O
         ZCcg==
X-Forwarded-Encrypted: i=1; AJvYcCWy++cPDbPulapqyybRNw0DqBXeD5Gf0N5dUGUB+iXokUFzb3oqFJaxfz076txyl5CSGjQO+ElqflJS0KYkDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSMDUPqoWh2cOMiA7Fk0bBD5Dd1islorKNLf8pzQ6WRMXwwI7a
	C5OBbPOg6ft0myaCOfhgBkdbuADiQvY9wKmKEXJu32mstzGyGokMJYizAvsVdrnn+g==
X-Gm-Gg: ASbGncvQFAStvZ/9LExUDW65nZr0O4K1Y7uYLCbMZVOoLrSV13lKyyw75HY8buj2PnP
	wksajX79NsGKqA/rWoLkharqG9E1JILSgyUkIipy7F6yx3XszZN8LQ+e+o4bhd7/fOQkFHSxbun
	R/Z3AK/ZHUXJa6gQLsVWY/tMZK+7DSWfxPBvxg9Jpyt0B+5DLJBhPfry4DJcKtThADeEL+hL4Bv
	y3Z6SWTt5LM51wdCC4IL9lut5nQ3y5I0V45723E0dzUH+igyl4+g3CcKIe9X8LmrKqr8unZs9pO
	T6tQgPNep/tE1roa9USkb6yDjz7hGvi7OMyIiqB9XQYQYe7p246dS9w/E3D0G3bUMKes8L8HqaF
	Fc/4yN4NHT51YnDbwSh0SVrVvWsyRc++1pn9sipQjaEV/FsoMZ0vH8IwRO0zxxhS+52C2+ThT2R
	2JldHCgCOFe3JKE/Lc0eCCDBoZf1RclQY+goTYrXqcZJ0gieGDNeXJAkj4OTX3qNPU9ylxGNE45
	w==
X-Google-Smtp-Source: AGHT+IFfNNZZ1N5hdA2Rzgdeu2MiPYlEFl4C9y1hCCjIX5eMBd16YLU0grlSCxevOHzpz/NXmGwdCQ==
X-Received: by 2002:a17:902:d4d0:b0:265:e66:6c10 with SMTP id d9443c01a7336-290275dda96mr7152475ad.4.1759942437279;
        Wed, 08 Oct 2025 09:53:57 -0700 (PDT)
Received: from google.com (235.215.125.34.bc.googleusercontent.com. [34.125.215.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034dea083sm2487245ad.24.2025.10.08.09.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:53:56 -0700 (PDT)
Date: Wed, 8 Oct 2025 16:53:52 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rust_binder: don't delete FreezeListener if there
 are pending duplicates
Message-ID: <aOaXIHS6YapFWytL@google.com>
References: <20251007-binder-freeze-v2-0-5376bd64fb59@google.com>
 <20251007-binder-freeze-v2-2-5376bd64fb59@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007-binder-freeze-v2-2-5376bd64fb59@google.com>

On Tue, Oct 07, 2025 at 09:39:52AM +0000, Alice Ryhl wrote:
> When userspace issues commands to a freeze listener, it identifies it
> using a cookie. Normally this cookie uniquely identifies a freeze
> listener, but when userspace clears a listener with the intent of
> deleting it, it's allowed to "regret" clearing it and create a new
> freeze listener for the same node using the same cookie. (IMO this was
> an API mistake, but userspace relies on it.)
> 
> Currently if the active freeze listener gets fully deleted while there
> are still pending duplicates, then the code incorrectly deletes the
> pending duplicates too. To fix this, do not delete the entry if there
> are still pending duplicates.
> 
> Since the current data structure requires a main freeze listener, we
> convert one pending duplicate into the primary listener in this
> scenario.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  drivers/android/binder/freeze.rs | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/android/binder/freeze.rs b/drivers/android/binder/freeze.rs
> index 74bebb8d4d9b24860eed34363ce69b1c6df58028..e304aceca7f31c15444cf67bb13488cd144345e6 100644
> --- a/drivers/android/binder/freeze.rs
> +++ b/drivers/android/binder/freeze.rs
> @@ -106,7 +106,16 @@ fn do_work(
>              return Ok(true);
>          }
>          if freeze.is_clearing {
> -            _removed_listener = freeze_entry.remove_node();
> +            kernel::warn_on!(freeze.num_cleared_duplicates != 0);
> +            if freeze.num_pending_duplicates > 0 {
> +                // The primary freeze listener was deleted, so convert a pending duplicate back
> +                // into the primary one.
> +                freeze.num_pending_duplicates -= 1;
> +                freeze.is_pending = true;
> +                freeze.is_clearing = true;
> +            } else {
> +                _removed_listener = freeze_entry.remove_node();
> +            }
>              drop(node_refs);
>              writer.write_code(BR_CLEAR_FREEZE_NOTIFICATION_DONE)?;
>              writer.write_payload(&self.cookie.0)?;
> 
> -- 
> 2.51.0.618.g983fd99d29-goog
> 

Acked-by: Carlos Llamas <cmllamas@google.com>
