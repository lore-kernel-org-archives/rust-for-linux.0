Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D437218050;
	Thu, 26 Oct 2023 23:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="A/RZIoOq"
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B984390;
	Thu, 26 Oct 2023 16:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ja/pCI99bhd2S/j3eMKq6Poj/Qhho61OZAFcUHEY6sk=; b=A/RZIoOqh4H53MHSVhUXRGuNEU
	duPFqRFAbIoluiCuf3oOxZE7hzAQ9fhh8foiC6K3aD1vGOxqvDYz60JYsX6LuRSzHmd0LAHLVWi02
	v+PSVHa9nRz8AsL3pmaxxPyltqCzNORxlf9JNjGl990SPOfnz8J30ooodbdcJLQASyZg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1qwAAN-000IGU-4s; Fri, 27 Oct 2023 01:53:31 +0200
Date: Fri, 27 Oct 2023 01:53:31 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com,
	benno.lossin@proton.me, wedsonaf@gmail.com
Subject: Re: [PATCH net-next v7 4/5] MAINTAINERS: add Rust PHY abstractions
 for ETHERNET PHY LIBRARY
Message-ID: <48ea5d93-353c-408a-9fbd-aacd141d0623@lunn.ch>
References: <20231026001050.1720612-1-fujita.tomonori@gmail.com>
 <20231026001050.1720612-5-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026001050.1720612-5-fujita.tomonori@gmail.com>

On Thu, Oct 26, 2023 at 09:10:49AM +0900, FUJITA Tomonori wrote:
> Adds me as a maintainer and Trevor as a reviewer.
> 
> The files are placed at rust/kernel/ directory for now but the files
> are likely to be moved to net/ directory once a new Rust build system
> is implemented.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
