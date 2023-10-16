Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467A227732
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Oct 2023 21:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="AHGmEZ0L"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA53A1
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Oct 2023 14:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Zqt0uxGcS4YQ3cWDFw+fWTp5g067EJCvYcDvJ2wy3O4=; b=AHGmEZ0L2pTcC7zIPKkGfLy/21
	2gJlp+PsycW/JnubCt42EUZdDl95w/+uUKch0v+0eZj836957o/uorex1RmMdnmDWSQVVR5/HZhFH
	8BHcVJYTaN+HqT5rWxtdkp9vUW8/OdG9tc4887nStz/JFSs6xsdtJPV3CKl5HUfehJxM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qsVRE-002OjY-ON; Mon, 16 Oct 2023 23:47:48 +0200
Date: Mon, 16 Oct 2023 23:47:48 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jamie Cunliffe <Jamie.Cunliffe@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, steve.capper@arm.com,
	Asahi Lina <lina@asahilina.net>, boqun.feng@gmail.com
Subject: Re: [PATCH v3 1/1] arm64: rust: Enable Rust support for AArch64
Message-ID: <210bae78-4f68-4bb3-9ebb-f3d9d07eb9fd@lunn.ch>
References: <20231016131523.1521965-1-Jamie.Cunliffe@arm.com>
 <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016131523.1521965-2-Jamie.Cunliffe@arm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -68,6 +68,7 @@ export BITS
>  #    https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
>  #
>  KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
> +KBUILD_RUSTFLAGS += --target=$(objtree)/scripts/target.json

It seems odd that adding arm64 support requires adding to the x86
Makefile.

Should this be moved into a patch of its own explaining why it is
needed? Do the refactoring first, then add support for a new
architecture?

	Andrew
