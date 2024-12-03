Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109EE207A3B
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 20:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733259062; cv=none; b=tek97AsoK53rmuT5AlXjWzpLlHCjrmgvtMom5PBRASSp3Elp6RrZ797IF8NUoKxwxPl12ELhFgqdc+nj7rXlQwrMh17wH7OzdnSI5ljwk668OSwkHqJTAHvyBx5CbzCS3AfUPYJ/4kgtvo5N2uL4YpSOrfzy+tpW7pWlZdzfLTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733259062; c=relaxed/simple;
	bh=TLTGs2zj63pybHSfDh7439F+9GscFwSW0JeSJSG1Nf0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXvM9KfgasbhTPpH/wQ6/VMnvxyvsPPGSSz257VFtWnThw+MRgb6ITAyyptYuN68/Vg/zm4ssIrw9Ca0K5VXBFImNh4qCWJ0CEXmUKowj9rTMC4HFaJo25O4mZrNFbbyc7YwEYfWkZtHnq3dvXNvLSL6aLFhzwwcXqS4/4sVO7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q9r28kd/; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q9r28kd/"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385eed29d7fso148500f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 12:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733259059; x=1733863859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLTGs2zj63pybHSfDh7439F+9GscFwSW0JeSJSG1Nf0=;
        b=Q9r28kd/OK3Wn9EHJJwvPP+wINPVexgy5A99tLIqaXoLYU7kYNg8tx22SLE8wBP5X6
         NJg8PscVriaf5CAnkd8A3WdtG1E+jguTWJHYh55BIczLx9Hmd61k9kJJDf7PVY7LrnHx
         pmHHd/vgXHNUuDRVVj9m77XwRi9Hs7S8n1djG6OR34FM9WQFBGFw5+up2daQ2hV9BGe3
         A5YZTZwBktQAN6DPsClznmyphXOLkNppTaWbGJiB0SW/McfzapbtYFpB8P4In+Rv2NuZ
         R3vXA75i4BunWTkOiUs452RZecwO+2u/JJrqqbXASJnoNn7npQ+kLr3ZRsJXekTbXbPV
         k0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733259059; x=1733863859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLTGs2zj63pybHSfDh7439F+9GscFwSW0JeSJSG1Nf0=;
        b=e84on48QorJMPDJKokGbHKpunKjL6CyzwLWygWfkeC8kU5osW4AQRlQKeuaH6O9hJK
         2Bd5MJqXhQ38uHzcZ9ksWDV4nsdACS/xC9CZJ9uJ2htfXGfdVNFgSGNUWVSSSbjV5E2/
         BbssMQGzAAPfHh73Ne6vX2J6lRxkICIXChn1Ir5BW+6Dc/gJ64XhzJRIG7onbdA3nv9b
         GLySG4mNJY0vaRq5Idh2ZafLLz0MJLj3/4ca6rTq4h3dYQ9ZrKp7AS+ExhCb0RTaMhWI
         /mE6cJxaLrJ5GM6FjZjRzVm2asa4GxF9Cu5vtnZkDceOpkkWjoi9EPTDsa7cDAmPnE66
         rhrg==
X-Gm-Message-State: AOJu0Yw3JAUqDaqeNcWULfvkGbWvUWjCCKY0TPwBchFfhQcQEfGf1qFu
	F+wU3mWZsmCGReF9ROX9GP1ILtw1eA2YEi13CgyJjRymIMvF+LulW+WYDkc1wCvyK7a7
X-Gm-Gg: ASbGncszP4UogOWkYYLIo6Z/ixtAHRHmRWeigWfTd9PzbHfrACnxY4FM+FQqjylmAU+
	A2JHZIKRfS3tSTerYp1o2+WEop9ugAkJU/zFNC5q7ha3C3bytF8pum6nVIY7VJi9BLr1GCy+DFQ
	vhUv4n7HNMeY8miJxoexsk39W2SQxInuBzJ2pLYHUz9P3amFAMzrg2YK/qWjya9WQhTm74McwxT
	bWk2dLChWBj8PqBMNQlDsUfoR5/oiYvMJzvQ1GpvMgs8wxC7DxlbHXYvgcLn+ZCaSfdOGaY1R8w
	cwaYZrbY1d+u4XfW+3xfyZLxyhVBT8PGNX87qK84m/Wj/zo=
X-Google-Smtp-Source: AGHT+IHn1exgnMgVG2K12/Sc630q7XNajx4zxLvWH0uXZUiZjIzzwEN5sZJaWEo/zIEdkWYDGqeh4w==
X-Received: by 2002:a5d:6487:0:b0:385:f07a:f4cb with SMTP id ffacd0b85a97d-385fd97734cmr3076440f8f.8.1733259058606;
        Tue, 03 Dec 2024 12:50:58 -0800 (PST)
Received: from P7.fritz.box (p200300f987065b00bdc782375f5a57aa.dip0.t-ipconnect.de. [2003:f9:8706:5b00:bdc7:8237:5f5a:57aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385dfb2d7e0sm13285863f8f.44.2024.12.03.12.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 12:50:58 -0800 (PST)
From: Xiangfei Ding <dingxiangfei2009@gmail.com>
To: rust-for-linux@vger.kernel.org
Cc: aliceryhl@google.com,
	ojeda@kernel.org,
	dingxiangfei2009@protonmail.ch
Subject: Re: Re: [PATCH] rust: use derive(CoercePointee) on rustc >= 1.83.0
Date: Wed,  4 Dec 2024 04:47:48 +0800
Message-ID: <20241203205050.679106-1-dingxiangfei2009@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAH5fLggS+3K8WHV7mrgTJQhGZMNni5gj9=huQtezc4GK8bk4HA@mail.gmail.com>
References: <CAH5fLggS+3K8WHV7mrgTJQhGZMNni5gj9=huQtezc4GK8bk4HA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you so much for the review!

I misconfigured the ruler and hopefully the wrapping is correct this
time. I have run through the crate again to apply the new name as well.

Here I will attach a fresh patch for RfL eyes.

Cheers,
Xiang

