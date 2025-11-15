Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757483C1F
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 08:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763193694; cv=none; b=tzZaUaD9VUqk+5OuziTN6W38EnVMtHUIfUqOlpAIgoQ4TV4dysRz53LMGarJTQIrAQH7HOwYMuaaox1v2M8iurSyqbclQhu9zMLUDgORK5mtwkp6WTYG6tLY0B08Eld+KTJg/oPXmLmjPkwD9Mn81l0BWggLLyTeO4CSdBehgC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763193694; c=relaxed/simple;
	bh=GPea8v+C6CZ4NaswYIQKCfHPmEXZ2BAAYp+oRZw7z+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7DnI0AU6EufdYoo9MehK7xDi0DkDbIsiWnvM0P0EujGxRQDBi620L4CoTHlOfs4Fn2iIYdCUi9UP52YKljFD6kJtL5OEelX9txGTJwNRX76imPG64wzDZo8cKp6xJca5iENB42BBIBom8YihBgd0cpyFOmR0jUatyU4CK5UlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3f7cpId; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3f7cpId"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29844c68068so25566245ad.2
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Nov 2025 00:01:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763193693; x=1763798493; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aAYAENnRQYD19CKiNMUWYlXpPcpPP46lLv9VD+gXegY=;
        b=O3f7cpIdplETii/DK/zOo9goDene2mvPKSRJ+RwJDkESv8unZgegYfjtDuLkk47xdP
         Jthnh3waPWVVeb6XlgAFvTIcWPctPUqhOclxt5zPynm3GSNaokTIL3EMsQduuGhdNadx
         9ARCDqxCoNV3DtlvXuM4DrEPZvvdbN1UynJcA6ek9vKBOu35ZNLqQ+u4WRz6nMQDOukD
         4+lK5oUEP3r4ZbogZ/7TGdMee0HdvrpDYtDetukdh+crgF4z3hjh1Bh93rsSc4HNJ5Fg
         XJBAlF8zxgbbyJQT2HFSZw/unnw/e4mA+vK4dgHtiKikMyWyogSzvfJrP4hn/cvzcYIS
         v/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763193693; x=1763798493;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aAYAENnRQYD19CKiNMUWYlXpPcpPP46lLv9VD+gXegY=;
        b=iqV0rDZLno4P8zKezVQadjNwI5Nt01hhbNOhjl0GNrMhtsZI6O4saSf6HXE/iH6dn9
         IEJXlSL/J+K4mQgDUGTlauEMKNBuDPjCKOE/MwmMydOtCo6lFyciRaI9amnur3d1PwoP
         eB6fBK7kmp2a6ibJi9W2SpTwBIfocTSpVKrhO1CpFn3noe+r5b/cgOnZoKzNSQ3qp2om
         G1ILowY1Ug0eiFnT3Ad1zbBW0auSIi3TbEO/5D8cQCdWF/pvzt1WFGRJ9kj/Gd3Dt2Xr
         HZvuMZtYS8JV3nUOoI96ssEIZ5zEANQqjUpEEuzUCADIveyvbnvJPT1bPjqxkCgfJmIb
         Ngiw==
X-Forwarded-Encrypted: i=1; AJvYcCXaNU60E9fqL61WLllqUnD5XmcTYQUXIncosLXPjbSG5XLPbQ2gbhTAZ3LeLIhMvMxzvihITLCyv2NWCvOYqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCbtkD1bpPyTkq6UeAjQtnjMqi1HQnPRtwdgYn3CcXzVPGOMZk
	iEG30BBOLmLXIvIsyUL7RC840JshGVjzi3ZHC4aFTRl3L+JjIi4TB3Tx
X-Gm-Gg: ASbGnculV59NFJtqgO3v5BAJSMhlfqnon5JyPlnPQdVxbXJCrKhlNSZXouyApJaMxV8
	b8URVkAsuUwcbv1IPCu3w1rSULkNuUTjXFBO1LoSIHBKwZBkGcIUOuMGWPZvmdeTtsmzJBMoOym
	SZcs/2Ml1BtPKC1fUXN8RceytPDTWJSuP5qyGdZXzpLGHlN+DHDJItBj3UqFEAaJHolC4mP10Wz
	1b1lmJi47drT2RLoEtedJGTe3EVdHHZhR8e7QEQKiq+kgCw5v33K53m4J5yzBfiHZlZia5JdNxG
	SIL6mCZyPxpqqprFvUjhq2lInAVI8+m81I8qc9QN3j3EhGHTvr4ycc8P22ToMJO9nT1BJQx1h+b
	8u6CMBhAG+d/JetNQ60zE+5dNPwD2rQYDmsYL3nj/cvDACi6rzB6zaVlv3+ArWDIRv4vC0hOH6Y
	Bdmsrh2WECVzn0eWFRSyFiyOhYPhE=
X-Google-Smtp-Source: AGHT+IHEN2mRU40eTIFziL9jKfVUWLwIHR9DBbKHOJZB0CnM+M25iCaVtz2d2f+nVbVfs/09LVH2fw==
X-Received: by 2002:a17:902:d58f:b0:27e:ec72:f67 with SMTP id d9443c01a7336-2986a6badc2mr68510065ad.6.1763193692693;
        Sat, 15 Nov 2025 00:01:32 -0800 (PST)
Received: from 2a2a0ba7cec8 ([113.102.238.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234644sm77467785ad.10.2025.11.15.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 00:01:32 -0800 (PST)
Date: Sat, 15 Nov 2025 08:01:27 +0000
From: Guangbo Cui <jckeep.cuiguangbo@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/2] rust: pci: Introduce PCIe error handler
 support and sample usage
Message-ID: <aRgzVyEMj2dnsSvM@2a2a0ba7cec8>
References: <20251108165511.98546-1-jckeep.cuiguangbo@gmail.com>
 <DE5Q13AXWVZC.1NRFHPA8CSO0T@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DE5Q13AXWVZC.1NRFHPA8CSO0T@kernel.org>

On Tue, Nov 11, 2025 at 07:26:42PM +1100, Danilo Krummrich wrote:
> Thanks for the series, I will have a detailed look in a few weeks.
> 
> I think this will be useful in the nova-core driver for instance. However, I
> wonder if you have another use-case you wrote this code for?

Hi Danilo,

Thanks for the feedback.

At the moment I don’t have a production driver making use of these
callbacks, only a few toy-level drivers I wrote for experimentation.

The main motivation for this RFC was that the Rust PCI layer currently lacks
parity with the C pci_error_handlers interface. Some parts of the PCI
subsystem (AER, recovery paths) need these callbacks, so having the Rust
side prepared seems useful for future drivers.

The sample driver is only meant to demonstrate the API surface and help discuss
the interface design. If the approach looks reasonable, I’m happy to iterate on
it or refine the API based on the feedback.

Best regards,
Guangbo
