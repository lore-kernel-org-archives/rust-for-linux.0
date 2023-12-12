Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpJl0Nne"
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955E0B3;
	Tue, 12 Dec 2023 15:31:11 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d349aa5cdcso1026145ad.1;
        Tue, 12 Dec 2023 15:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702423871; x=1703028671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QsjM367fa6clENluFuDiSWHKmDiBTaLY09qdeJ4z4jE=;
        b=NpJl0Nneim1kVJD3CcUYSEifqcV4Y8/yArIk8MsVIUimipiTRKUKD5Ozsl6XyrDy1j
         vATgEjKScLmAUFOUjgrctEq+HG6U/AwljBkUjAx+FhFcYwbRo4fnjPqtQFREzCBqXRn2
         aHDMRkboEBq+n0LszThU0/bf/5RWuBPsARkJRTsVm3MgsbsuJibDzaJ61K5aeP9YB1Xn
         lYfcc6NzMeKZeOMpBPoh5dY6UO5n8BP4fYaRYXtn7YZc0HOY6bO57z7AWYVZmdvuhVPt
         nKdp27VcW7g6TnIh3noiA+eOsmJLfvmG1vr+JBszhzVvPhwEjE/BR7DFIlVY7gJR81wq
         pP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702423871; x=1703028671;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QsjM367fa6clENluFuDiSWHKmDiBTaLY09qdeJ4z4jE=;
        b=bOSPJi21Jexlut/gAu+lXZp062wdgppxRYKUEz7r/rFFaT3PUJkjMxJGItgSIO8b5m
         5/RHLgIL0DQlx6sCDyKj8KwERC/UJICBCGrx7Y5Ke3XkccoI7NTL4vxctbqnL6j0X1A6
         2yHaEqArcp4vW0Cz8xtM2ZAMQNnao2D8xDG20YVBSTaSBTcl0+nlgPusQtiac2VfBM0M
         T6hSBygw7AtAxqHohS4n258tHI3m36N/sEvOYeG4IZuBxDLkvvAC8ErO4uQ5q+KvEF15
         pGxto0q92jsFZ2ujxp2kcfP6cdC2xvxYB3Cdml+kgWCe8ShYo1b31twjAOBCwXlt/8o0
         qeSw==
X-Gm-Message-State: AOJu0Yx8fEPbJnGRDAJi6084pwNK2ZLeO8I+Sqb1I56KdoZGS4Ym7aEV
	sehZ3ziTKrAPBz5DnbIslw0=
X-Google-Smtp-Source: AGHT+IHv3exHvhJ4r7lyw8S7Q7oU2bNB1feAg/yOXA304/6sAgsN3mzSxHLSHO4bkKQpvpG1mKmyEA==
X-Received: by 2002:a17:902:ea0d:b0:1d0:b693:ae30 with SMTP id s13-20020a170902ea0d00b001d0b693ae30mr13685382plg.6.1702423870831;
        Tue, 12 Dec 2023 15:31:10 -0800 (PST)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id f10-20020a170902ce8a00b001cc8cf4ad16sm9241077plg.246.2023.12.12.15.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 15:31:10 -0800 (PST)
Date: Wed, 13 Dec 2023 08:31:09 +0900 (JST)
Message-Id: <20231213.083109.2097548498951503416.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: benno.lossin@proton.me, fujita.tomonori@gmail.com, alice@ryhl.io,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, andrew@lunn.ch,
 tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com, wedsonaf@gmail.com,
 aliceryhl@google.com
Subject: Re: [PATCH net-next v10 1/4] rust: core abstractions for network
 PHY drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZXjBKEBUrisSJ7Gx@boqun-archlinux>
References: <20231212.220216.1253919664184581703.fujita.tomonori@gmail.com>
	<544015ec-52a4-4253-a064-8a2b370c06dc@proton.me>
	<ZXjBKEBUrisSJ7Gx@boqun-archlinux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 12 Dec 2023 12:23:04 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> So the rationale here is the callsite of mdiobus_read() is just a
> open-code version of phy_read(), so if we meet the same requirement of
> phy_read(), we should be safe here. Maybe:
> 
> 	"... open code of `phy_read()` with a valid phy_device pointer
> 	`phydev`"
> 
> ?

I'll add the above comment with the similar for phy_write(), thanks!
