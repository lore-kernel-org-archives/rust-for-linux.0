Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF54358D0D
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Dec 2025 18:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764960044; cv=none; b=GQEYrG0eFggoyJPiBEbwaPbviLS5zGoJTUNHOBw2AMATuoFoIQSxCGcvFUtE+nelZ25RMqY7ZKQH77yAnaQTf/2r3xQAZKVW2DpOhiRKZsaKCJWXS+WCdu2PxHDLRh2XpSyI3u/ue/rAfYOdMwOmfVzokdaRPi3uH6/Ps/UefzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764960044; c=relaxed/simple;
	bh=6Yy3IShQVWKoUdXCDZD3yBqKU2764SqgOZHs7jYW65g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HjRvmOcY0vnZ/FGMbOIawwVbD1AAYFzCmv0PyjHeq9bdljX3t2ujMLBO1ULkX2lcN8O1nXvPrD9xp3QR4studJR/ZW4Y0aac4kXx0Se5LRQ1A8AE9Hzk9GiW04bneda7NR9Lg/yM8ysd13Q/oXy30ui417/qQqCf2ohIWWe7iUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OB4B8ACn; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OB4B8ACn"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7e2762ad850so2410230b3a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Dec 2025 10:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764960040; x=1765564840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gx4zuHCdfmsBvfViSx4dewQ3NC0pwlIv6go7qc93ekw=;
        b=OB4B8ACnPwttjampNMBOyr5SQc3Lvq62ehcw0tv8++5+w4VkufFKGOxcDXbCKO0ZfO
         pqHpYswzVY/GbBPI+w8G4ywayCKLapa5R5RRM5i2PHXKwztAC+JznM87b23IhWGIJEVT
         yG9433rpC9RO7QrY1GfZ+wpMP2+38InsAw4QmJFd1Bjsg6AGdaT1bZaBxwH4CGQ4fMcE
         aId8rOKhpwqC3YyolpgTi+TLuRH/VfgLCHC0pVdT/YZ6awxPOzVVMl6bTAP733KmyNnW
         M7SgQvULVcIthAa8zUMJM8LwpiUB1HemuP45Sq/wLzODq6jNbAW4kOyCRQJSdAnQZsSt
         +pBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764960040; x=1765564840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gx4zuHCdfmsBvfViSx4dewQ3NC0pwlIv6go7qc93ekw=;
        b=mhqTNqMpWNcgpqQfQagCk7tS96nynuMaACXL11joDFTJkM90i6VK/Ry4NsB5AqCYWN
         1x7yY/JaEXYADQ2Mxe0R2BrxWZvdsyoNAt8zcPRuc6iMWJ2Fi4VF6pNEOPtf0S3g9Uu+
         eu89MUNlHRj9HEdMYyICu4Q6U3/CMWVhpY2wuzDj07rH8od5QElJL2NdB+WHpRbpVjnJ
         386DRJnInhV8UbSBZ2mbV8Tcdi3bgKlFM1Qm2cVVXQPI2ny3F2iXjniURBBMQyeIp2yE
         EFQvoJ+sznqSyVDtqnTBAqO0cGWS9pmkZYjXUYlB4FuSnw9Ujgsu0V6LzDIM+ld4zq5U
         73dA==
X-Forwarded-Encrypted: i=1; AJvYcCWxSFBrT8/3MGexawHVIeAdXB4LO4dFcq/QmAcj4aRB+cP0y5dckA37oQeU8OcvJQxKcLDLaBmWYEZmmeqKBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCyjT3tnRkTwuC55vQNknSinuDiXSmC8n/RLQH8h5rSyJIWgW4
	/N4ad/hY29+IOYExN73S69I0U/pyh+e3TNyL4r10R0XV2K1eyJ4OFPSj
X-Gm-Gg: ASbGncuaKLUqEG9nUxCAbvURrGH+v+LSK+867dq8yTojH2jn97zR6K6jtbv6+JG8s0v
	ATRgdGm+SyS28Vt4hz+3RS1iVHZ1IJjtY6mFt36qkVot6DgFIS2RtTSZ7qKilSWaf6sPj4izBtj
	DJTkB7afhrOTQx2B2TDXc5jor+L4JMxXeEaXzv6whyFRyRfxTGOPbjjwp7uZeWs3xjDC5CzrObZ
	mLroTgEVzdT9mrL7IiM1+cShKdJd5NB4tacRhmReFW87N5e7Bp0VdkAQLZPdwXPzyLX2KL36yNr
	kjjdBkZrRpFsbE8/YQCMjkETTJ12/WZwCMiP1EipyNZyzkGNJzuiBYoAImV12CysMofd92zYMOq
	nXt7l4a1DUDrzyhSk326R2bN/cEoDtSJpSz5WKrEjoDNARZmw9VzvM+tNYiR/dlZq/qdD0+yowF
	vNQaSt/8qeW4H0OwbB7D7TGIRfWQ==
X-Google-Smtp-Source: AGHT+IFdaIOl2EVfDf53MnHxu6h2Csp/9+fkL7qdsbkngVF7MJLua/LR1xBA2DmFila+UaeQfEKpNw==
X-Received: by 2002:a05:6a00:ac3:b0:7e8:4433:8fb5 with SMTP id d2e1a72fcca58-7e8c6cab76fmr135748b3a.61.1764960039751;
        Fri, 05 Dec 2025 10:40:39 -0800 (PST)
Received: from shankari-IdeaPad.. ([103.24.60.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a0533f08sm5952079b3a.23.2025.12.05.10.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:40:39 -0800 (PST)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
	Michal Wilczynski <m.wilczynski@samsung.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 05/10] rust: kernel: Update ARef and AlwaysRefCounted imports to use sync::aref
Date: Sat,  6 Dec 2025 00:10:23 +0530
Message-Id: <20251205184023.7230-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1b7408c5-64a8-42f1-92ab-dd90a883c1a4@gmail.com>
References: <1b7408c5-64a8-42f1-92ab-dd90a883c1a4@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Igor,

> 
> NIT: This module already imports `AlwaysRefCounted`, so please use the
> imported name instead of the full path for consistency.
> 
> >       fn inc_ref(&self) {
> >           // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
> >           unsafe { bindings::i2c_get_adapter(self.index()) };
> 
> Thanks
> Igor

I apologize for the overlook. I was just focussing on changing the path. 
I'll make the required changes and send a v2.

As this patch is part of a series, am I supposed to send all the patches with a v2, 
some have been acked by already, hence I had the question?

Thanks and regards,
Shankari
