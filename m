Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29D216133E
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Aug 2024 22:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724885590; cv=none; b=MPd6ayTIh3rgb1j4b5SuJE2ALy+iPQaPOC82EKjBbVAp9+0yIR0Tb5ZOcQzvU1zfWfba3LuA9gsUKkkZE2ynxY9cUhZYC9khHVSJecdx48ZsxdkwCbN4VkJ/oZF9svmmvRfRNItWChM8Hy4EjQiPF0UyyGqPnyfAwJUcvLVtBCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724885590; c=relaxed/simple;
	bh=vBcDKzqZD0IGH+kMo+OOysCrPxyHMCAFpcXSn+OPSOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGeQ8evrJHd9e5lbvOx0AduZLrY3qfRtvbc3W/Q7xwchFMP2TbYyZ0ImwYY3L8MtBL1PCE6q/jZt1pknpV7ngdO5eSihG8gJ9zDb9HFoX6RV5aMqmkZm8JuwIasGpcyPyk38ghN/CMCc0oGAT1jVuLq0HgmiPzhOmjFb0TY2HYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d2O4GfF7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d2O4GfF7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20260346ca1so76955ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Aug 2024 15:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724885588; x=1725490388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nAbDwChQbWZl01mr4KnwFnysig2L5blgWIiA7h1UA+g=;
        b=d2O4GfF7WopxCnqOqwsLLniMZHCWPaQPvt3QIdMi9YZJEaqqeR649XtcrztBfCf9pU
         kAtum6pMD/WYzjSXmPMS6gfRJfqy3ugo074qqigzq7jsj7zZr0XcuT1mhg+tr7OV9elY
         a9Q6d+jrqmjd6d3sdJV0xWFfcLDw8mmqCujW/lyEbrB5AJ4AEqlM7dzsznVNcJ43Qbab
         OQwFuJyfQWDk3cuo+TzqsTN0uhtrH7eBpqtvebW3yXpKQHlG88snSzU8TD+sK8iz3Ehr
         twQOQBMJxEz+np6I3dLHVZBcyMyOCApLKo77SIlJNJPjSd0V3m6+TMHMK/Fp9tMYi+Sj
         mvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724885588; x=1725490388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAbDwChQbWZl01mr4KnwFnysig2L5blgWIiA7h1UA+g=;
        b=EB9f5Z9t3RfNqLRCp1kkg1WqUw9UxNKzpTJc+p/u0boSfhWQ0UfQV6HHZWlkMQqSX0
         V+xTnJ9LH1Wg4puB1fksAmYJNe113ERQjgMkiRh40jpBvoyqpNhf7eX6oIHPMB/bClYJ
         aDJjX4ToUSUKJzfCB4u3nUDQ3abDhhds6dx+6MRDZ0VU2i7KHSQGgaNcNxTCEqLgUoUD
         xsw8OqmzqD/3Rhhg1CNRSdSuQG+GKGss1vufT25w2DcrapDb7+kHB1u3JLBvJoTBdeeU
         kwWiehQVpV563HAvPLJawGPsL+3oW4HAODlj2bZ8FBOj7XPd7HdiIRi0JX0ynGX4SbXu
         A2Fw==
X-Forwarded-Encrypted: i=1; AJvYcCV0zcpzpKEJuhhtPdyFBZj8ABdFdhN9GQhTErCZLbpX7SL3ONgK1C7fq9ZGiRRoEkAe0mWqMZKCebXzRSIPWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YywewQR/HXNje+Y4LxBdSDLLionwc6mBPetqV/gsOZkxlQjCCX2
	9ZTL2f2Kp+lScOcwj04uDZZy0R5QzZQmioKuG5IvQ0jfbc3PCAR0LXltALPCsg==
X-Google-Smtp-Source: AGHT+IEQaTc+wud0mzSYI+hEe/4PWmz2+rLLZ8+Mx8YVlCteMCgZHZsbCbUbqJpRqiB0krS+Bxb7ZQ==
X-Received: by 2002:a17:902:e849:b0:1e0:c571:d652 with SMTP id d9443c01a7336-20510a7f2e1mr522765ad.1.1724885587784;
        Wed, 28 Aug 2024 15:53:07 -0700 (PDT)
Received: from google.com (83.92.168.34.bc.googleusercontent.com. [34.168.92.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2038557eec1sm104064935ad.91.2024.08.28.15.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 15:53:07 -0700 (PDT)
Date: Wed, 28 Aug 2024 22:53:02 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthew Maurer <mmaurer@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
Message-ID: <20240828225302.GH2130480@google.com>
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <CAK7LNAQ0dHq3eALkvGDSCyVKOvhBqwCEG3BTQ0h52Xq_1YNu2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNAQ0dHq3eALkvGDSCyVKOvhBqwCEG3BTQ0h52Xq_1YNu2A@mail.gmail.com>

Hi Masahiro,

On Wed, Aug 28, 2024 at 04:04:09PM +0900, Masahiro Yamada wrote:
> On Fri, Aug 16, 2024 at 2:39 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >
> > The first 16 patches of this series add a small tool for computing
> 
> 
> Splitting a new tool into small chunks makes line-by-line review difficult.

I split this into smaller pieces to make it less of a chore to
review, but I'm also happy to squash these into larger patches if you
prefer. How would you like to see this split instead?

> For example, 02/19 adds malloc().
> 
> 03/19 immediately replaces it with calloc().
> 
> Then, I wonder why you did not add calloc() in the first place.

Yes, that wasn't ideal, but like I said in my other response, I tried
to keep the churn minimal. Please let me know if you spot any other
annoyances.

> And, I do not think it is so "small".
> It is bigger than the current genksyms.

In my defense, the first version was smaller, but sure, I'll drop the
false advertising from the cover letter now that it has more features.

> > symbol versions from DWARF, called gendwarfksyms. When passed a
> > list of exported symbols and an object file,
> 
> 
> Why is "a list of exported symbols" passed separately?
> 
> All necessary information is available in the object file.
> (The export symbols are listed in the .export_symbol section.

Unfortunately this is not the case for Rust object files where exports
are handled separately. Passing the list of symbols as input feels
more flexible to me, and also is rather convenient for debugging.

> > - Added a --symtypes flag for generating a genksyms-style
> >   symtypes output based on Petr's feedback, and refactored
> >   symbol version calculations to be based on symtypes instead
> >   of raw --dump-dies output.
> 
> 
> 
> I do not know if this is worthwhile.

Greg, Petr, do you want to comment on the usefulness of the symtypes
output? I was under the impression it was a useful tool for figuring
out exactly what caused the versions to change?

> And, it is obviously a build error.
> 
> gendwarfksyms cannot create %.symtypes from %.c.

Ah, this obviously needs to depends on the .o files instead. I'll sort
this out in v3.

Thanks for taking a look!

Sami
