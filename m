Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B0E271A71
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 12:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769861071; cv=none; b=ZaIhqLV+15Wq+9f+5xe5O5Fdqtst0vY5L+ql8cjEQbqVcq/aSmTDcvVrNYkG1fD5aQIq1UrUtAQV8Sn6d8H+7SzH9q9vAKgkqBs6uofUEkyhXzGpfn+G5cOGTViLZKPhS0cdNZbN4rZhtDWgPMG0gkY/XiKZtTcKnBfi+5T05IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769861071; c=relaxed/simple;
	bh=pQtGoWTf/kP7oWRtNw04OSR02CvadRIpfDDbFfx2CZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kN2LTQhH85RmX2lOpcORqw+SnBxaN+hJEkzpu/iiEcAN1nDCqruepPdnXCAKPxBh3Pj3+sK+hr0r+ShLjb5XgL1AgJ1R3LqWgmXA1iKkuaBg4lyARyLPvQa6Y4OKXTO5V2GEc9875wyIb44I40Yp9eWCPfPTMFkda29NbA+PLcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcsXyEBG; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcsXyEBG"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-352f60d6c2fso1909497a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 31 Jan 2026 04:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769861069; x=1770465869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oJs0CNczZrgoZIEepOSl4LgDQSPruQiihq3nw1O9hE=;
        b=BcsXyEBG5QAQ/zgRUZ8ylYlXAIBdFAMvp+5goONbTW5Tc03pdPNAbjxcZ83F9uV/oh
         NSarX6rNK6yPkjlcqfp3bkCluzgv7DehEOJxiHOh4aMwyFJwJOTgqaJ3ij3enm01nbTV
         aYHhhWOesK0CQ03rI6eLGdGY7qRJdYIHiM/yrLzpBClsv/tu4uzyG5oErMA7fH4/vOSv
         Im2FGQv9Al6J0PgEcdfsRFj8YfZkfBbvzuhWofg5HlYCrB5gmkxvmlBzk/YN4dsrPmBN
         zzDOHCsMPZyhxjFZR/5w2Ee7H7kOX37WexZHPsAit5O1V71Ah3kW2vJZu0gDyKnhKsH5
         Aw8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769861069; x=1770465869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9oJs0CNczZrgoZIEepOSl4LgDQSPruQiihq3nw1O9hE=;
        b=stHRqCBX/+WU7a3LpShEHIgQdO8VZihpRLbDtsKk5dqqQcvjCi8L1ShibTWhAIx0uE
         89H0jSDgi9ok1pEjL0nVLf88zEMZg4RdFFmYtIYMBQty5aOAirpJCuEJmY5iG1g2o6Lr
         YV8v0ooZhpv9HSj7pU+OGr0URF/jxbJciMrWan1L9FTeQ2/6F68/Kja9WK9d3P1FLI4J
         qivBPcr3rjPqnnPDnpRWvFLWWst+ADGNiaxLldWvFbbGmrk/SprgG/HgLZxLOQbrrHMN
         iRkYFDonETvskK6rZmACT9NbZgSEj2ZYeAisz281xHYoXebZ0uR+v6FVhNn6RtJFbPwK
         7QNg==
X-Forwarded-Encrypted: i=1; AJvYcCXp8a5HYVnwVFl/pJPGXFUNq5Xb9MmRaQxOmZ4he7sF90ShU8xc7lpnsHWuY4nXw8hPWLoeZHezDMIpKU7+zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqtBL1PL1SuJrZk8GHyziWMZgRu1rlXDsEi3VCaju4+WD7SC1K
	c7y4cVJnJVQPv//1S/AkRXVXDkDd5Z71e0/JWwuLQ2Zv9qOVg+kzSFM5
X-Gm-Gg: AZuq6aKRNJ4Mfr4oqvh2zAe5DXGNWpIxZlnixcmmX2konAPjIAoTjTnp6WDtpPiM9lS
	UnxVyjHXo+3aCopK0aXRvfzkux4SOPNAxzyMLv9M3fkiM7ouqq4QA8j/2nsFOrR3a83b4pyXigH
	o6K6CgpsH9tcTTrMeRBSz8OcQg1IK0Jyl2gb8APEC87cIv/aV9VZ9XdI1hnzDYhSiFBhUcyY+W+
	19WwtTqR2md/LBRjOsQJ5B7mdBHfGthlUA+jzv+cdwZ5U0LW7WDI+KIJ2nEkoFoz93cC7EgrvmB
	ajNsi+4vIXRmP0btXLHpeEtMgU/EX5qj0oz1YaxKjMPbukpuLz3oQxDBnk2t6RcT+DYEOzf8uYo
	MlbQHq9CEHoiW3sX3qaYEpW0QjcAwZ6G/xoSnVKTCZeSeRgpsBSCPswuVPfx0SlcY2waokjzNpH
	mwS5J1XvCiB6qJ/6YQLokN5d3ngGw=
X-Received: by 2002:a17:90b:3f0c:b0:340:d569:d295 with SMTP id 98e67ed59e1d1-3543b39413amr6046384a91.24.1769861069151;
        Sat, 31 Jan 2026 04:04:29 -0800 (PST)
Received: from shankari-IdeaPad.. ([2409:40f2:7:99c2:2d1f:8664:c99b:8d4e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6427da8441sm9184975a12.9.2026.01.31.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 04:04:28 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Martijn Coenen <maco@android.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Christian Brauner <brauner@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alexandre Courbot <acourbot@nvidia.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Igor Korotin <igor.korotin.linux@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: Re: [PATCH v2 4/4] rust: types: remove temporary re-exports of ARef and AlwaysRefCounted
Date: Sat, 31 Jan 2026 17:34:08 +0530
Message-Id: <20260131120408.7173-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <<DFIONMNAAA7L.790NWN6D7VS4@kernel.org>>
References: <<DFIONMNAAA7L.790NWN6D7VS4@kernel.org>>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Jan 07, 2026 at 10:42:44PM +0100, Danilo Krummrich wrote:

>  
> This is because the failing build was against the staging tree, which
> (obviously) does not contain all the relevant patches to remove the temporary
> re-export.
> 
> Now, I have no idea why the bot pulled this series to build it against the
> staging tree though. But it should help to use --base when running git
> format-patch.
>

Ah, I see. I'll ensure to include the base commit henceforth!
 
> Also, note that this patch can only be landed after all other patches went from
> their corresponding subsystem trees into Linus' tree.

Yes, agreed. Hoping other patches get picked up soon so this clean up 
will be completed soon!

Thanks everyone,
Shankari
