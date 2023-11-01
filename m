Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327EA14A8C
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 18:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QEg9Absd"
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50805DB
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Nov 2023 11:39:54 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6c311ca94b4so145590b3a.3
        for <rust-for-linux@vger.kernel.org>; Wed, 01 Nov 2023 11:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698863994; x=1699468794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Mg/KOVePNmARti1sogxRuGEfS088YfXRvhg4XGoDqCQ=;
        b=QEg9AbsdoCDwu751NWaz2ExNNwm+QN5DoqzDwWLGSr/HPHEJ8zSFMIO4Zlk26+UT6X
         kz62Uz34LUj8O7hoBaNunajFvCVTWEd/3NDuxU7hG44A/hhO6r981+ICtH0lAWc6iDbK
         RFt/3iquQYaHNNMWxccauawpa5IqCjCtqjJZ/sej6zBuH1PhmElmkx4kCvAQAVWXEN3O
         Hbu5cxm+CVTd+JaEJU+hiM8/zERccg9xGp4DpS6pjQoWFXw5H2QqXvC20ppOqwAmFiuh
         CccXG0vp9SKSkI8Up4WA8i9y3NdRgeTPR6JxB8lZRTfD1OLByuR5X6xmzV/l1Zu0BBYu
         aLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698863994; x=1699468794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mg/KOVePNmARti1sogxRuGEfS088YfXRvhg4XGoDqCQ=;
        b=LktQ1hO4P1u8rdQbfzeRpgA5KMxN94CysSoOTtm/ey4BR+Tb36jTqKhYhJcGFsAIo6
         FKGPjHqTTUxbRpv07RMAVs1XeADl8eHzww4QDotIH6nhigx6SDoC1BDUyueU9WrMUTo+
         FgKqSnZg/ziHcUsLtHK1ExyEIBolr9yT8qXBx2JeTnYCe+FZQdfK0i/9R/ctNxX9IRaL
         WMG9vLTpUOiUFyJtOqK48usVzdGJaOXcjUBIkCDptqAaj6H029/ttsoPHNYXXymATbX0
         ylUyQtPAcaKeRAqXjoSRMYGiMRysFETzxhvxnfR7uFhEvk28SYxgxXIgquod7+xD70dZ
         lpWw==
X-Gm-Message-State: AOJu0Yz/xumiTe7ELn76srRLrbOxVrQqbq4u1WX48okhbQDBOtuQob1q
	JGd96Ea33hE2zPkIq4IIwGdtlw==
X-Google-Smtp-Source: AGHT+IGX9dGN/qHysgy7FuH2Yx3/QSCyXb1D8xpssIcNpGbPZzlCSbMBfIQrHf7OX0XWBa1fP+cLiA==
X-Received: by 2002:a05:6a00:2356:b0:6bd:ca1d:c51e with SMTP id j22-20020a056a00235600b006bdca1dc51emr18008629pfj.16.1698863993632;
        Wed, 01 Nov 2023 11:39:53 -0700 (PDT)
Received: from google.com (209.148.168.34.bc.googleusercontent.com. [34.168.148.209])
        by smtp.gmail.com with ESMTPSA id ka14-20020a056a00938e00b0068bbd43a6e2sm1612983pfb.10.2023.11.01.11.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 11:39:53 -0700 (PDT)
Date: Wed, 1 Nov 2023 18:39:49 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arve =?iso-8859-1?B?SGr4bm5lduVn?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Christian Brauner <brauner@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matt Gilbride <mattgilbride@google.com>,
	Jeffrey Vander Stoep <jeffv@google.com>,
	Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH RFC 20/20] binder: delete the C implementation
Message-ID: <ZUKbdaBsfg0DyIMu@google.com>
References: <20231101-rust-binder-v1-0-08ba9197f637@google.com>
 <20231101-rust-binder-v1-20-08ba9197f637@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231101-rust-binder-v1-20-08ba9197f637@google.com>

On Wed, Nov 01, 2023 at 06:01:50PM +0000, Alice Ryhl wrote:
> The ultimate goal of this project is to replace the C implementation.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Nice, great work Alice!

As far as logistics I think it would be nice to make the transition
right after an LTS branch off. This should give the Rust binder more
time to mature before landing on the subsequent LTS release.

Acked-by: Carlos Llamas <cmllamas@google.com>

--
Carlos Llamas
