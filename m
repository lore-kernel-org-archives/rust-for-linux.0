Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDA3DE444
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 16:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773246003; cv=none; b=TU20znzFlPwwGOz1cWk2zKwMuq14HQbJf+YAlT47VYIfHP7RHx92wqDu9MavE3h4a28K2RJu3A9BlchlBKqrQloRof6mkZdEODJllS3RYLsnQmgtzXaPXMLxNYyb7uzEL8lFMlEp4kVsouOEIM2zVfftdqFqwGD2QhAmFcmal6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773246003; c=relaxed/simple;
	bh=Ng0YfQ3/DVQjX5cXB6cJ+DCnShmWcLC9Ad3MF6/bsnA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HU+anjhEa/tReW/Uoev4ZzTtdif3hqlIKPJZjwnJtMCwfAACyZwP0BAEcL9KgQcydzqsw4g5mGwechUOiO+oQTQ1A4HmExdUql8II3h0PjCzK6eJk8YArCi92jfaxVUxOHmciYscynlbIsL2SDSZ9MfCuxjs2o4f01dYEb6l/qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qi2pj242; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qi2pj242"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3599019ae92so8979a91.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Mar 2026 09:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773245999; x=1773850799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6Dvb52AUtp5NjSAV4dWx2c44pxpmPlkRg+s14Rf6nI=;
        b=Qi2pj2429VMeLsUMLkQzbHL287a7L0HXVgvHfHEbas4gKv7SiBoV046kebQlXwzfOp
         P6zCwlSGVqlsctsOO7AIM5FN0L2QJP0A4shNkVdjtHpE9ojXjiIRYOJ1UxWD/xgGAa/x
         8lVwNM3zKhDqb5dSGMjC/WI3fg62vvebHs7y033AKEU5/wjtn3tRI9xc/HdPXMHSWphr
         ADeyqYpLaffnlyRTtdguykIH8I4Rq4tqu4DwysLMUODcKDRqEBBv2O8Sys0J9ixyO0C1
         h/I8MbvCmA0dPkltIbQpQ74dylCrO8Y0mpJpZc/h/ojxdcDAHMTyUzP+BUoLtDe/5FH9
         W11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245999; x=1773850799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6Dvb52AUtp5NjSAV4dWx2c44pxpmPlkRg+s14Rf6nI=;
        b=PR/fYRrUCwJDZYrNGN4Yl3PxsN+R5nU2jZ76lMqgRsZT/IAInxL2mRANHMhJw2TG97
         7GFuCZJDPu11dqXW4p+sd+KuhjJxa5mxjgccBJpPG7TDxCkNoDFjdYVuAQoHRUcJQ3r0
         Sc6za2H4Mxh3J/eM1yeiesl6MEn5bpULs9fW4xUTZtbOuh8b3OCS1pKnYou+mDPZlxoO
         rZqKIRl5OT8LyfrqdWMOMO93PJqS+D8z1Bmpdx1V4JyP4rLB0lVeBjLP8uYCaAlRcDeI
         yi3iyWCLVHAqI3pR+sPkMGHPq6xAN3qO29JnAGmwUUMJpICzi9yF2i+razvOLyaBi7En
         FEig==
X-Forwarded-Encrypted: i=1; AJvYcCVfRY2HCeM8VSdejvXxtpZkeLeWEk4NcuRXiVYE2Mh+zSfe4Xo0t8yzxuzKccXzbaVOiCfaBySYb0UTwVkdWg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmVJuz7NL472UfMpVCciXGgvcAxOIGlRaNpQGW7cg6r2st2ekq
	r/SSEbaNCVk79opLXI4L7PggSNB7LhEOccALWyQTiZO6A7biLLMwh5UT
X-Gm-Gg: ATEYQzy3RJqZfNPTyGOnpqrvgbBk14ggc9LuDLCipcOFnMo1jxUJ7OQ5XiKp54ZUFeC
	Zkz0OV2VciCmIwKhzIpFBPvpU2oQEyOp+AxoHufoPGHB4Tq+EuXSMCARlUa/MbflsRBGlODY3N7
	wiKXTIWgDgfQv/aZWccdNXBpNhjQvYw4CKVLb5RmMiMzkbcmJ59dW6pUdNk/Tzn8Qxme6tZ8Ew2
	gNhWGiqisALKkNn5G4E4acqQyG0mIzqknPfxc/P8qUZayOdtFY/EU5qJg+8kFLdxX+4SS8oc/No
	uw2fL2SLBs+tzQCCPEHXnXMmdE0FMBxqj5oanbjeL86jlp1Tj53CsG1qxioUd7+1b9JRLXf9E88
	co/EUKlypI8YIIEx0O/730F4CeGUH+Nc7D1YXcU7JMfWw77yYbefl+ABIrULtIzkRNNj6UmPc7G
	+dyb8yPtRXTt+moTtogmuaRRrEZlIS6d8hHLrf
X-Received: by 2002:a17:90a:fc45:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-35a012aeb09mr2679774a91.9.1773245998679;
        Wed, 11 Mar 2026 09:19:58 -0700 (PDT)
Received: from shankari-IdeaPad.. ([43.247.145.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdf92d8esm2938366a12.16.2026.03.11.09.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:19:58 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: Re: [PATCH v2 0/4] rust: refactor ARef and AlwaysRefCounted imports
Date: Wed, 11 Mar 2026 21:49:44 +0530
Message-Id: <20260311161944.13083-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CANiq72kbVRVZCtU_9FWdPnqwOi27RY8Xr1v5DcoD6FQBqaCZ9w@mail.gmail.com>
References: <CANiq72kbVRVZCtU_9FWdPnqwOi27RY8Xr1v5DcoD6FQBqaCZ9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Mar 07, 2026 at 04:43:51PM +0100, Miguel Ojeda wrote:

> It would be nice to get it done, yeah.
> 
> I think we were waiting for maintainers to individually pick them up,
> or to get Acked-bys otherwise.

Yes, absolutely. The second one has been acked [1] which can probably be picked up.

> Cheers,
> Miguel

Regards,
Shankari

[1] https://lore.kernel.org/rust-for-linux/20260102202714.184223-3-shankari.ak0208@gmail.com/
