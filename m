Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B564175A69
	for <rust-for-linux@vger.kernel.org>; Sat,  6 Jun 2026 15:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780760371; cv=none; b=t5lVgXP7v1EUV5apgOL3rneaILFABn1UiAsPWgOz9Lhn/Ulq0qq1Cv+FxXf87fmdatpLydUqgT7mCe2PJckIA6cmGcIaXfPg9Q/hLJrNPBz/NlzR40g+hahRrLOAcC/Q3dgMsjGduw6+RV5t7G3SyeotBGiomNsA2anY+4OHHIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780760371; c=relaxed/simple;
	bh=ufkwTlSXf3ZWG1Dce5sP9AW5G+vLKGXNBj0iluLZVZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M4uEDb52TTtEouQKdS6EPIelZumTlCOr2Evnu81dXz7B2AvPARnFm23C1Te24Erw6wDfRz/IylBKuVUt0aZD0UUktZfamquHd6Em1NMtYj1ME4kStEWnBfHzRZstG721bwmiAI5Cs8QfbdTDlawczqzuciQZ1qPpKoJYtpwNe4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ByWYB/cv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ByWYB/cv"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2bf2911f93cso165585ad.1
        for <rust-for-linux@vger.kernel.org>; Sat, 06 Jun 2026 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780760368; x=1781365168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqoLt1G0zuPhE5ck7aafsVgdkXtWSkd44IQ+/jjkZyM=;
        b=ByWYB/cvXr/ClV6Fkhh9LFM7lNIDCM1kOlRQ8HWXKu69rqHuGfjhFodgyj0LiKb0D0
         b/vXI9lJtZecZH+7I1mnwXQJkLYQYFsQcVbfFVw3AqNnA6yiVjq2xNIo71O2YW+lVCkg
         5Akb/HMBFAPcz1jvA64WMGqG22ZioAP+i1+wsCU7BA029ooSWp4+uXyHCJjlgSJddHXT
         3SVnIad6pGH0nh5IErI/H6R6BU3OyJlrPB2eRbTG4dC0zpb+tGRimE0XTLGstxxDPKdq
         zNJHlXb8AWzsHw5T/wLSGn4J5kh6JxwI328DZjZk/nS8v00OezGZWfVWuX8hGC/lNoD6
         Z/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780760368; x=1781365168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uqoLt1G0zuPhE5ck7aafsVgdkXtWSkd44IQ+/jjkZyM=;
        b=JdUZfifbz7HOYTkC59j6TdDLD08yU55UyNUu3SqpbcFUq10mhtEPw3DtxmP2p11PPi
         SJwyj1Je78ZvJRU/JEJKWco3Cufq5400teLwyKzA8qveuvgMrjMf2a0HdfHCDPsJWCcJ
         7Gk18J27BAqnwoiicmQQ6Ap+THA8f5BshS3uD0cy7Yjqz2jP68SZLIiP269qh1CNAkFT
         jEBhlPFToNn16P+FXJ1O7JPg5L00S0XZoUPfDlCYExjXYvCbuCh5mWoTAMYflV6wRJjN
         Kg1ffp7Dibv5mTY22uDMfJ5IMm5xmqtRyPjkwZJkHYh0Lh8MYIbH2kdvlj9ix7rjl6rV
         mGig==
X-Forwarded-Encrypted: i=1; AFNElJ/eZ5cxyXQnWb1C9PCAyYVjAAV94S8XUoc+952yy5/OZ62yFqiHwnalzPyUMGmeDiNPC1lteUZ5ZS1oXfU5/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNZrXDKAqZsWdYZuhoqAeYDwp7CIH0AjVIaTUKvGySGNfDBaDX
	QXyzRme2gDHxPJEAGH9u0t5s29TilI210CFAqwiuNC25dEc1sapX5iM+Qxnh1jEYEA==
X-Gm-Gg: Acq92OGNsKVJYgAt3LY1zL/MbiEtM4kzPzzqcKLdnSrXNT8MQJb1B882aB2NktpYYio
	OjelRTnZdjcmF6nE6WqpNKK7GfSl+npthkba62DZcm2xyMjf0u7nRgia0pC71ug1it2sqiUK853
	gaOUl6KKERS/4x2RoFWE8rp0jZaVPKSKCTjdImtkq7WtM8UVA4xolszWRYCxoUchNJ5upDzJjH+
	DN4KMAeZiKcWZ1dXYkxrlo1mENRgWkydZ01L2pV60TBaopxPWWLPMxZiFpu318VKcFAgAWHVA5+
	f3igFHjtP3SlbBYvi4v+Lg3t2BqiKSuofYHljOef0C9wxM4tRXBIyYclP4mNAYck9pJSAgaB0I4
	axjIMwcoHLdnaVKOA9DBTqVW/VVJQBsKThx9W3tlyrtdaJYLn6rbptut784SKUVeAOrhpF1Kznn
	teDtOTp/5Gq8tWOgKbzGf7nBW3DlzwIVcNZOXDzaHnxyuH3GIqhbiAc3gJESWzlmTlEkDxJJSqw
	wo17s3QU8nfdaZIJX72okG3mFzgDfzyxYfLRcT9IVrnnBuuru1gaUTk
X-Received: by 2002:a17:903:8c3:b0:2c0:c14c:bf37 with SMTP id d9443c01a7336-2c1eb50a69bmr3034435ad.16.1780760367949;
        Sat, 06 Jun 2026 08:39:27 -0700 (PDT)
Received: from google.com (112.174.16.34.bc.googleusercontent.com. [34.16.174.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e2adsm135347905ad.5.2026.06.06.08.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 08:39:27 -0700 (PDT)
Date: Sat, 6 Jun 2026 15:39:22 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Donald Hunter <donald.hunter@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Matthew Maurer <mmaurer@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v6 1/3] rust: net: add rust/kernel/net to NETWORKING
 [GENERAL]
Message-ID: <aiQ_KizsNCBFOGRZ@google.com>
References: <20260529-binder-netlink-v6-0-92dd74b6a32e@google.com>
 <20260529-binder-netlink-v6-1-92dd74b6a32e@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260529-binder-netlink-v6-1-92dd74b6a32e@google.com>

On Fri, May 29, 2026 at 01:28:38PM +0000, Alice Ryhl wrote:
> To ensure that networking code can be found in a single shared place,
> add it to the relevant NETWORKING entry. The net.rs file is moved into
> the net/ directory so that it's included under the MAINTAINERS entry
> without needing a separate rust/kernel/net.rs entry.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Reviewed-by: Carlos Llamas <cmllamas@google.com>
