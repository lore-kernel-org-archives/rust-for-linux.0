Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCB13D258
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Apr 2024 07:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712303062; cv=none; b=GMbwXc9uKHfkeL60Ys4eVIjGosMIGHxSvqnd/1GZtAcM+fb/XmKSaMbimYW8MGw8CHonU580WDSxfA7vib7wrlm55VGuhEeO29g7RamahQBJTtvCGfBwYUlZi7PnNMGiA6/+TxXg3aWhspVVuoBJjEdNyeKTiVmNH1wlhzcpKXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712303062; c=relaxed/simple;
	bh=SHGbtYE78WACdauHUN0T3sz6l7y4v0ZFIs1aCPJUAfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcmJJvvufslToR1XXF+7Hy6pTCsva8FCDICyEAq50+bhfeNcJS73Du3PrPZvVOJm3YW4Qhiha7jvz8wWg8uvTafSyfINUY0k7NAAlnI4Zaw9AhWwveXw3K6YIqrO7UNptZ1l3ad6TWE24IVSbgA/Eg1Rn9V7DLz/jqJO8/FwXWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=okUN6yzJ; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="okUN6yzJ"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7e5f9c15d83so135177241.0
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Apr 2024 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712303059; x=1712907859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHGbtYE78WACdauHUN0T3sz6l7y4v0ZFIs1aCPJUAfs=;
        b=okUN6yzJEqwBDFZGJZL0LcADDUilMBNKJN8H7jWZR05NbtB4cpOanmzpMjHANSONZV
         99U6ofHCD42rVReWS4zc6lFac32qpV0ihfRwWZSZQLTKqiSDg9DEL10UKYMMrWzPGeK3
         EeauzsP/2fK3E7GeMPc1E+qRrnLULQ4XRqUPaPTvrKlw48pac09Mn9K75w7k4z61uKoV
         TsOWZo2DND3gVyfh50eMzslQXDWlLaXrEAhA12adDuRbzCiU5aaQ9jFE9RkX8Q8dt7CV
         eY4Iy7ZAm/LpmJz4w2mZuePUZbVwFSgmhyeMGh2RixH5ki2R7qlfUBhkuHHVTJws9j+N
         B+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712303059; x=1712907859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHGbtYE78WACdauHUN0T3sz6l7y4v0ZFIs1aCPJUAfs=;
        b=nwP0k29fXk09tLUm05CCbp/zsMJEGn0ik+cCODKVTtEOOLHEyGxiRThMCjOcWcJNEY
         ykQLjb4d5+tcaY9kJ//Ssmcv/54nKPAvANxwoWAvPYaT2ASq3RdAEiZ2ZgXosv57brBd
         HsBTVzKWZGdFThvcigqpUdxF4QSedblnmRgagqXzgbwHgvJVSDDNfp3Jfy85T++RtXoj
         3IZNJvrsJJoaJKgK56KObGuli8EJM1zgfNr/Eb425UtAgdhx2GY25M0aVI05tYmD0/MD
         X+7+LTdZB13XBmu8wEtxvreEuEUCvDWs9KhWcMaNvMw2hmbbz7Z38e6TrlzNZELqsTfd
         Sd+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRD8RXc8mlz8jUgUrHDSHSW067xquDEorQuSbQYJ+oHaBDMYiETcqExsuTroC2PKA3DXpmNdVdOAifiHtOrX9kC6fD0zf+M08QLc85glo=
X-Gm-Message-State: AOJu0YxzyA3hngggdzbRR8znHZ7kg+moQBXFQ9xAXjPjbA955qLHTGuE
	aQT1tJN+JMytofLcQJvZqtO8mLER7Mii2nbVKrLyhAFTiOZN2JFXRRAHVKe6jwcXRPR2V9cPlui
	RdzmbShYB6YmJQK5JRStfgwg8WtPZNpNq2+yn
X-Google-Smtp-Source: AGHT+IGMeMqrXZ0hb7q26iSJbPXd6dY3rpQtcLC3/bDQAURqKv3BShFGpUtYoVqS9r2ldERtJ0iVFeg0BVc9I60Wl/c=
X-Received: by 2002:a05:6102:512c:b0:479:c401:824 with SMTP id
 bm44-20020a056102512c00b00479c4010824mr1516533vsb.6.1712303059454; Fri, 05
 Apr 2024 00:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404-alice-mm-v4-0-49a84242cf02@google.com>
 <20240404-alice-mm-v4-4-49a84242cf02@google.com> <a48b2347-b58b-432e-bdb8-d5449016ab57@proton.me>
In-Reply-To: <a48b2347-b58b-432e-bdb8-d5449016ab57@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Apr 2024 09:44:06 +0200
Message-ID: <CAH5fLgg3wpcDE+n6nd0CGtDzyXSrD2nLhY8RxdTHjAD8hQ9VDQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] rust: add abstraction for `struct page`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2024 at 12:33=E2=80=AFAM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> On 04.04.24 14:31, Alice Ryhl wrote:
> > +/// A bitwise shift for the page size.
> > +#[allow(clippy::unnecessary_cast)]
>
> Why can't you remove the cast?

Bindgen could decide to use a different type in the future or on
different platforms.

Alice
