Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180C123D297
	for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805382; cv=none; b=aQEvTiy/pOsY3r+Aw+llGbpBWQJKh/MazYum8vjrRFn5f8XFU0nL+3B1TFpXkrsb80EBDrpvw/shewx5bwBvBkh0/7ktyDlx9y8Nwr7LAoYGyXU4Zmderau8PS5yqoahmvIk3Qci4tS1/f8hczDC5wFQz4N4xZ4oINbu69y7cpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805382; c=relaxed/simple;
	bh=Thd+96srbIxv6nkA2oYQM0B5WWUG4+CD9S2xoBLb1lo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=UxN0E8bPa2Q/Qc9/e1JSGaw9gNLK35eP+omM+J3bEfie/7CrObtd5XS0V1LFlLrC2wBWCvUzrZAh/ulsVeBU5G6Zkeyhqfl039DuGY+nDj+QPUQRby0a5DYo9jcBrBYJgnhWsSiTCfVrqO3hQHJgzkB9cJ9CWEDssE3flKQfuSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6+8e3zJ; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6+8e3zJ"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301a8b7398cso1115191a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 16 Apr 2025 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744805380; x=1745410180; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E74AYG2rgbs2vUVuU+Hti00xgOpPTIkupMIupkfwzTc=;
        b=Q6+8e3zJDiKagCKqJtig3ibiBo2TyhVhurr0fZ12MdRnAwqUkBwcldc7IBiOfWqNvu
         +GaLKiaZB1pIZPqoKLnqmzlZhgYVKyb3jhbcG4QNKPLdOlvK1WxjCeHhl+nQckTGLS8B
         3m2fJASbfT0LcQ6CkZ04ibMR/oGcUihVLHX/iyJh8isuD/QjU9HF+PGMBF7tKsV3luXl
         bVKqElIALoDFyD0o31DL5jQvW4OYsqQlhEtKn5tU5cF5GDWkChbCqBN1vQQTyIkqITov
         E+yc/a0zY+z3IMTowlz54+PjhcnYtdrjZI72GLiF6HJ0O8znAaXUKzIVYhXIm1UdumhQ
         qvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805380; x=1745410180;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E74AYG2rgbs2vUVuU+Hti00xgOpPTIkupMIupkfwzTc=;
        b=EudesWuL7ntVqy1tCwcL3mY53Iw7qN+nN78rZ9yO7oNlBwjhE7UI/nfm/bJaTWbCwl
         c8YSbVLDk7bMqsspRjKq7OpyOghG7dJErDhFbHu5sZh0lLkIf4lzkX0hBY1OMbF21PkL
         s6yWMPTGV8K+tbbLQk4gRLu37E9b9zHMK+s3ZLTJtsKg1fZpzt/cTLmn3+blvfmzNtxt
         eJYeoa/WXxgwznTDb6l19eoQqL6IEnwoGsvjbTiqseIWzIFtvjLO0kYVTnjUc1jB9dFR
         w06aeyJZjAmYr1icdVmIwv5LVsj6kWu4vbu3MNP4OnabVPHHIXB23A6ePl8/M9L8C3V7
         rcQw==
X-Gm-Message-State: AOJu0YxhMjXurmx9m2OsWT66VG+N5AQlDiDnsMOx4YIk/oUBGX23bw2T
	JS/txWkuScvwUqutwItQu4nfVssQeugKgRmgYKbte+xUb1kR7FtdvM37KkSat2AwRzXGbZBQZ2L
	JNgQhWJSjbieIkk6YN7dAWG13behL2qGRlxcj6w==
X-Gm-Gg: ASbGnctVhyK+/lw+v1bvDFFwcslUdUdxddn+DdLGctghNXe+L2Khq0u9hT7qiiPbio0
	AvuQqFiAvU2hneqpidVCAlVkX398qKtFG4a1+HdIGgCPOXwGH5a1DmaEqVtPxGfeKX8QB4ZFhn1
	e5k2qKI5m/P0fGJM821HazMQ==
X-Google-Smtp-Source: AGHT+IElPdpbD/jYIPAd8jdDhFppqoUdSRkM6ImJDknlCb7QI5hqq8rsMdYw4COd763NbuJZneobhrwb+663kHy/5d0=
X-Received: by 2002:a17:90b:4a4a:b0:2fe:b45b:e7ec with SMTP id
 98e67ed59e1d1-3086418c538mr943360a91.8.1744805380313; Wed, 16 Apr 2025
 05:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 16 Apr 2025 14:09:28 +0200
X-Gm-Features: ATxdqUHcDJzlJ4BsPJ8K1WpHwZYg5NKbb-wfgKwra9MFIzZ6EQGfABMIsNh-Yg4
Message-ID: <CANiq72=TWeXSPFm_y=HPqQHOTxSfwN47iqgaJrgG5-2FZzQAdw@mail.gmail.com>
Subject: Patchwork instance for Rust for Linux
To: rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

As requested, the Rust for Linux mailing list now has a patchwork instance:

    https://patchwork.kernel.org/project/rust-for-linux/list/

We will have to see if/how the entries will be maintained, but for now
I hope it helps to have an index to browse easily!

Thanks to Shyam, Chris and Konstantin!

Cheers,
Miguel
